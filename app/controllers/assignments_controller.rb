class AssignmentsController < ApplicationController
  before_action :admin?
  before_action :logged_in_user
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to new_assignment_path
      flash[:success] = "Assignment created"
      User.find_each do |user|
        UserMailer.new_assignment(user, @assignment).deliver
      end
    else
      render 'new'
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :description, :link, :due_date, :start_date)
  end
end
