FactoryGirl.define do
  factory :rule do
    criteria { create :criteria }
    column { 'price' }
    values { [] }
    value { FFaker::Number.decimal }
  end
end