# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    start_date "2013-12-10"
    end_date "2013-12-10"
    headline "MyString"
    text "MyText"
    media "MyString"
    thumbnail "MyString"
    caption "MyString"
    timeline_id 1
    user_id 1
  end
end
