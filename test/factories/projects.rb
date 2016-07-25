FactoryGirl.define do
  factory :project do
    link Faker::Internet.url
    title "MyString"
  end
end
