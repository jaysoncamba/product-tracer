class CriteriaManager

  def initialize(params)
    @params = params.deep_symbolize_keys
    @criteria = nil
  end

  def update_or_create
    @criteria =
      Criteria.find_or_initialize_by(id: @params[:criteria][:id])
    @criteria.update(@params[:criteria])
    update_or_create_rules
    @criteria
  end

  def self.build_with_default_rules
    @criteria = Criteria.new
    Rule::REQUIRED_FIELDS.each { |column, _| 
      @criteria.rules.new(column: column)
    }
    @criteria
  end

  private

  def update_or_create_rules
    @params[:rules].map do |_, rule_hash|
      rule_hash[:values] = rule_hash[:values]&.split(',')
      new_rule = @criteria.rules.find_or_initialize_by(id: rule_hash[:id])
      new_rule.update(rule_hash)
    end
  end
end