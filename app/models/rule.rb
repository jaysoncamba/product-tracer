class Rule < ActiveRecord::Base

  REQUIRED_FIELDS = {
    reference: Array,
    category: Array,
    price: Integer
  }

  belongs_to :criteria
  validates :column, :values, presence: true
  validates :column, inclusion: { in: REQUIRED_FIELDS.keys }
end