# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
def new_project
  user = User.first
  UserMailer.new_project(user)
end
end
