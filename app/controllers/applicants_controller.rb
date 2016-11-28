class ApplicantsController < ApplicationController
  before_action :admin?, except: [:create, :new, :show]
  before_action :check_intake_open, except: :accept
  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(apply_params)
    if @applicant.save && @open
      flash.now[:success] = "Your application has been received."
      ApplicantMailer.application_request(@applicant).deliver
      text = "Thanks #{@applicant.first_name} for your interest in code9ty. We have received your application.\n\nRegards,\nSigu Magwa\nCoordinator - code9ty "
      @applicant.send_sms text
      render 'show'
    elsif !@open
      flash[:alert] = "We are not open for now!"
      redirect_to root_url
    else
      flash.now[:alert] = "You filled in something we didn't understand"
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
    @accepts.send_sms("Hi #{@accepts.first_name}, Kindly come to LakeHub on Monday 12th Sept at 0800hrs. Check email for more info
  Regards,
  Sigu Magwa,
  coodinator,
  #code9ty"
    )
    @accepts.update_attributes(status: "accept")
    ApplicantMailer.applicant_accept(@accepts).deliver_now
    flash.now[:success] = "Good choice, an email was sent to the applicant"
    @applicants = Applicant.where(status: "accept")
  end

  def destroy
    applicant = Applicant.find(params[:id])
    if applicant.destroy
      flash[:success] = "Applicant deleted!"
    else
      flash[:alert] = "There was a problem deleting the applicant"
    end
      redirect_to applicants_path
  end

  private

  def apply_params
    params.require(:applicant).permit(:first_name, :last_name, :mobile_number, :email, :github)
  end

  def check_intake_open
    @open = Intake.open?
    unless @open
      redirect_to root_url
      flash[:alert] = 'Please wait for the next intake!'
    end
  end
end
