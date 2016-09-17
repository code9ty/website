class UserMailer < ApplicationMailer
  def new_project(user)
    @user = user
    mail to: user.email, subject: "New Project"
  end

  def project_approval(user)
    @user = user
    mail to: user.email, subject: "Project Approved"
  end
end
