# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :supplement do
    title ""
    image_url ""
    rating ""
    supported_goal ""
    main_ingredient ""
    nutritional_information_id ""
    url "MyString"
  end
end
