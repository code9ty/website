class ApplicantsController < ApplicationController
  before_action :admin?, only: [:index, :accept]
  def new
    @applicant = Applicant.new
  end

  def create
    open = false
    @applicant = Applicant.new(apply_params)
    if @applicant.save && open
      flash.now[:success] = "Your application have been received"
      render 'show'
    elsif !open
      flash[:alert] = "We are not open for now!"
      redirect_to root_url
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
    ApplicantMailer.applicant_accept(@accepts).deliver_now
    flash.now[:success] = "Good choice, an email was sent to the applicant"
    @applicants = Applicant.where(status: "accept")
  end
  private
  def apply_params
    params.require(:applicant).permit(:first_name, :last_name, :mobile_number, :email, :github)
  end
end
