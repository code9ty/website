FactoryGirl.define do
  factory :user do
     first_name  Faker::Name.first_name
     last_name  Faker::Name.last_name
     university  Faker::Company.name
     year_of_study  Faker::Number.between(1,5)
     github  Faker::Internet.url
     mobile_number  Faker::PhoneNumber.cell_phone
     email  Faker::Internet.email
     password  "cartoon"
     treasurer  false
     admin   false
  end
end
