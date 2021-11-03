class Criteria < ActiveRecord::Base
  validates :destination, presence: true, uniqueness: true

  has_many :rules
end