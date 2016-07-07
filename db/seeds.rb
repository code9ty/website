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
 treasurer: false
)
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
  project = Project.find(rand(0..20))
  user.projects << project
end
