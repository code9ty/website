class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome. You have successfully signed up"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    console
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :university,
                                :year_of_study, :github, :mobile_number,
                                :email, :password, :password_confirmation)
  end
end
