class Product < ActiveRecord::Base
  validates :reference, :name, :category, :price, presence: true
  validates :reference, uniqueness: true
end