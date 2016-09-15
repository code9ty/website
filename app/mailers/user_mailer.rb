class UserMailer < ApplicationMailer
  def new_project(user)
    @user = user
    mail to: user.email, subject: "New Project"
  end
end
