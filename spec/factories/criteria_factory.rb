FactoryGirl.define do
  factory :criteria do
    destination { FFaker::Address.city }
  end
end