# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :timeline do
    headline "MyString"
    text "MyText"
    media "MyString"
    thumbnail "MyString"
    caption "MyString"
    user_id 1
  end
end
