class AssignmentsController < ApplicationController
  before_action :admin?
  before_action :logged_in_user
  def index
    @assignments = Assignment.all
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(assignment_params)
      redirect_to assignments_path
      flash[:success] = 'Successfully updated assignment'
    else
      render 'new'
    end
  end
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
