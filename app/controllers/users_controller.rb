class UsersController < ApplicationController
  before_action :logged_in_user, except:[:index] unless Rails.env.development?
  before_action :correct_user, only:[:show, :update, :edit]
  def index
    @users = User.all
  end
  def pride
    @users = User.all
  end
  def new
    if params[:email]
      applicant = Applicant.find_by_email(params[:email])
      if applicant.accept?
        @user = applicant 
        @disabled = true
      else
        redirect_to apply_path
        flash[:alert] = "Please apply here!"
      end
    else
      @user = User.new
    end
  end
  def create
    @user = User.new(user_params)
    @applicant = Applicant.find_by(email: @user.email)
    if @applicant.accept?
      if @user.save
        flash[:success] = "Welcome. You have successfully signed up"
        log_in @user
        redirect_to @user
      else
        render 'new'
      end
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @comment = Comment.new
    @bids = @user.bids
    @assignments = Assignment.all
  end

  def dashboard
    @users = User.all
    @feedbacks = Comment.all
    @user = User.find(params[:user_id]) if params[:user_id]
    @feedback = @user.comments if @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :university,
                                :year_of_study, :github, :mobile_number,
                                :email, :password, :password_confirmation)
  end
  # return true if current user 
  def correct_user
    if current_user
      @user = User.find(params[:id]) if params[:id]
      unless current_user?(@user) || current_user.admin?
        redirect_to user_path(current_user) 
      end
    else
      redirect_to login_path
    end
  end
end
