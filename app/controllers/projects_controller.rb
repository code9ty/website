class ProjectsController < ApplicationController
  before_action :admin?, except: [:index]
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project successfully created!"
      redirect_to projects_path
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
