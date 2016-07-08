user = User.create!(
 first_name: "Mak",
 last_name: "Atunga",
 university: "Makatunga University",
 year_of_study: "4",
 github: "https://github.com/Makatunga",
 mobile_number: "0712345678",
 email: "makatunga@makatunga.com",
 password: "cartoon",
 password_confirmation: "cartoon",
 treasurer: false,
 admin: true
)
3.times do
   first_name= Faker::Name.first_name
   last_name= Faker::Name.last_name
   university= Faker::Company.name
   year_of_study= rand(1...4)
   github= Faker::Internet.url
   mobile_number= Faker::PhoneNumber.cell_phone
   email= Faker::Internet.email
   password= "cartoon"
   treasurer= false
   admin = false
   User.create!(first_name: first_name,
               last_name: last_name,
               university: university,
               year_of_study: year_of_study,
               github: github,
               mobile_number: mobile_number,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin,
               treasurer: treasurer
               )
end
project = Project.create!(
  title: "Test Project",
  link: Faker::Internet.url,
  due_date: 2.days.from_now,
  start_date: 10.days.ago
)
user.projects = [project]
20.times do
  title = Faker::Commerce.product_name
  link = Faker::Internet.url
  due_date = Faker::Date.between(Date.today, 28.days.from_now)
  start_date = Faker::Date.between(4.days.ago, Time.zone.now)
  Project.create!(title: title, link: link, due_date: due_date, start_date: start_date)
end

2.times do
  project = Project.find(rand(1..20))
  user.projects << project
  2.upto 4 do |n|
    User.find(n).projects << Project.find(rand(1...20))
  end
end
