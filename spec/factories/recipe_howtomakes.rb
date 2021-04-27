FactoryBot.define do
  factory :recipe_howtomake do
    name           { Faker::Food.dish }
    chach_copy     { Faker::Restaurant.type }
    point          { Faker::Restaurant.description }
    upbringing     { Faker::Restaurant.review }
    many           { 2 }
    price          { 1000 }
    material_name  { Faker::Food.ingredient }
    quantity       { Faker::Food.measurement }
    material_price { 300 }
    text           { Faker::Food.description }
    association :user
  end
end
