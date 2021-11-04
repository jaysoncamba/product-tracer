class Rule < ActiveRecord::Base

  REQUIRED_FIELDS = {
    "reference" => Array,
    "category" => Array,
    "price" => Integer
  }

  belongs_to :criteria
  validates :column, inclusion: { in: REQUIRED_FIELDS.keys }, presence: true

  def value_as_string
    values.present? ? values.join(',') : value.to_s
  end

  def value_attribute
    REQUIRED_FIELDS[column] == Array ? 'values' : 'value'
  end

  def included_or_equal_to(selection)
    REQUIRED_FIELDS[column] == Array ? values.include?(selection) : selection == value
  end
end