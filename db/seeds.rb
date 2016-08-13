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
  # due_date: 2.days.from_now,
  # start_date: 10.days.ago
)
user.projects = [project]
5.times do
  title = Faker::Commerce.product_name
  link = Faker::Internet.url
  # due_date = Faker::Date.between(Date.today, 28.days.from_now)
  # start_date = Faker::Date.between(4.days.ago, Time.zone.now)
  Project.create!(title: title, link: link)
end
# 5 times user ids
1.upto(4) do |n|
  user_id = n
  # for each user create 20 comments
  20.times do
    learnt = Faker::Lorem.paragraph
    problem = Faker::Lorem.paragraph
    suggestions = Faker::Lorem.paragraph
    possible_fix = Faker::Lorem.paragraph
    rating = rand(0...10)
    created_at = Faker::Date.between(60.days.ago, Time.zone.now)
    Comment.create!(user_id: user_id, learnt: learnt, problem: problem,
                    suggestions: suggestions, rating: rating, possible_fix: possible_fix,
                    created_at: created_at
                   )
  end
end

# assign users 2 projects each
2.times do
  # project = Project.find(rand(1..5))
  # user.projects << project
  2.upto 4 do |n|
    # get a random user from the database
    random_user = User.find(n)
    random_project = Project.find(rand(1...5))
    random_user.projects << random_project unless random_user.projects.include? random_project
  end
end

#seed assignments for the users
3.times do
  title = Faker::Commerce.product_name
  description = Faker::Lorem.sentence
  link = Faker::Internet.url
  due_date = Faker::Date.between(Date.today, 28.days.from_now)
  start_date = Faker::Date.between(4.days.ago, Time.zone.now)
  Assignment.create!(title: title, description: description, link: link, due_date: due_date, start_date: start_date)
end
