class UserMailer < ApplicationMailer
  def new_project(user)
    @user = user
    mail to: user.email, subject: "New Project"
  end

  def project_approval(user)
    @user = user
    mail to: user.email, subject: "Project Approved"
  end

  def new_assignment(user, assignment)
    @user = user
    @assignment = assignment
    mail to: user.email, subject: "New Assignment - #{@assignment.title}"
  end
end
