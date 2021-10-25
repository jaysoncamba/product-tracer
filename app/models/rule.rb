class Rule < ActiveRecord::Base

  REQUIRED_KEYS = %i[name reference category price]

  belongs_to :criteria
  validates :column, :values, presence: true
  validates :column, inclusion: { in: REQUIRED_KEYS }
end