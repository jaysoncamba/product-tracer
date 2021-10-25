class Criteria < ActiveRecord::Base
  validates :destination, presence: true
  validate :rules_keys

  has_many :rules
end