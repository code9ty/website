class ProjectsController < ApplicationController
  before_action :admin?, except: [:index]
  before_action :logged_in_user
  def index
    @projects = Project.all
    @bids = current_user.bids
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.js{}
        format.html{
          flash[:success] = "Project successfully created!"
          UserMailer.new_project(@user).deliver
          redirect_to projects_path
        }
      end
    else
      render 'new'
    end
  end


  private

  def project_params
    params.require(:project).permit(
      :link,
      :title,
      :due_date,
      :start_date
    )
  end

end
