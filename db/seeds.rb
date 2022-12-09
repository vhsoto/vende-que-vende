require 'faker'

5.times do
  Product.create(title: Faker::Camera.brand, description: Faker::Camera.brand_with_model, price: Faker::Number.number(digits: 4))
end