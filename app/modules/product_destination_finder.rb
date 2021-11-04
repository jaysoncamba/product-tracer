class ProductDestinationFinder

  MAX_POSSIBLE_POINTS = 3

  attr_accessor :product, :sql_strings, :sql_values

  def initialize(product)
    @product = product
    @criteria_id = ''
    @sql_strings = []
    @sql_values = []
  end

  def find_product_destination
    criteria&.destination || "No Matching Rules found"
  end
  
  private

  def criteria
    @criteria ||=
      begin
        return unless @product
        build_sql_strings
        rules =
          Rule.find_by_sql(base_sql_string + @sql_strings.join(' OR ')).group_by(&:criteria_id)
        retrieve_criteria_id(rules)
        Criteria.where(id: @criteria_id).first
      end
  end

  def retrieve_criteria_id(rules)
    max_score = 0
    criteria_group = rules.each do |criteria_id, rules|
      score = get_score_from_rules(rules)
      if score >= max_score
        max_score = score
        @criteria_id = criteria_id
      end
      break if max_score == MAX_POSSIBLE_POINTS
    end
  end

  def get_score_from_rules(rules)
    rules.sum do |rule|
      if rule.column == 'price'
        rule.value.present? ?  1 : 0
      else
        rule.values.empty? ? 0 : 1  
      end
    end
  end

  def build_sql_strings
    Rule::REQUIRED_FIELDS.each do |field, field_klass|
      if field_klass == Array
        @sql_strings.push("(rules.column = '#{field}' AND ( '#{@product[field]}' = ANY(rules.values) OR (rules.values IS NULL OR rules.values = '{}')))")
      elsif field_klass == Integer
        @sql_strings.push("(rules.column = '#{field}' AND (rules.value >= #{@product[field]} OR rules.value IS NULL))")
      end
    end
  end
  
  def base_sql_string
    'SELECT * FROM rules WHERE '
  end
end