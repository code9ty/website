class ApplicantsController < ApplicationController
  before_action 
  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(apply_params)
    if @applicant.save
      flash.now[:success] = "Application sent an email will be sent to you if you are choosen"
      render 'show'
    else
      flash.now[:alert] = "Error saving form"
      render 'new'
    end
  end
  def show
    @applicant = Applicant.find(params[:id])
  end
  def index
    @applicants = Applicant.where(status: "apply")
  end
  def accept
    @accepts = Applicant.find(params[:geek])
    @accepts.update_attributes(status: "accept")
    flash.now[:success] = "Good choice, an email was sent to the applicant"
    @applicants = Applicant.where(status: "accept")
  end
  private
  def apply_params
    params.require(:applicant).permit(:name, :email, :github)
  end
end
