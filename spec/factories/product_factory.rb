FactoryGirl.define do
  factory :product do
    reference { FFaker::Product.model }
    name { FFaker::Product.product_name }
    category { FFaker::Product.product }
    price { FFaker::Number.decimal }
  end
end