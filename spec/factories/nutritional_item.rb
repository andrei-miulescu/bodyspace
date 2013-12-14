# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nutritional_item do
    ingredient_id 1
    supplement_id 1
    quantity "9.99"
    unit "MyString"
    rdi "9.99"
  end
end
