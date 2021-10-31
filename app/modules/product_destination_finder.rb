class ProductDestinationFinder

  MAX_POSSIBLE_POINTS = 3

  attr_accessor :product

  def initialize(product)
    @product = product
    @criteria_id = ''
    @sql_strings = []
    @sql_values = []
  end

  def find_product_destination
    criteria.destination
  end
  
  private

  def criteria
    @criteria ||=
      begin
        build_sql_strings
        rules =
          Rules.execute(@sql_strings.join(' AND '), **@sql_values.flatten)
            .group(:criteria_id)
        retrieve_criteria_id(rules)
        Criteria.find(@criteria_id)
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
      if column == 'price'
        rule.value.present? ?  1 : 0
      else
        rule.values.empty? ? 0 : 1  
      end
    end
  end

  def build_sql_strings
    Rule::REQUIRED_KEYS.each do |field, field_klass|
      case field_klass
      when Array
        @sql_strings << 'column = ? AND ( ? = ANY(values) OR (values IS NULL OR values = ?))'
        @sql_values << [field, @product[field], {}]
      when Integer
        @sql_strings << 'column = ? AND (value >= ? OR value IS NULL)'
        @sql_values << [field, @product[field]]
      end 
    end
  end
end