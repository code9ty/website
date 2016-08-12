class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) 
      log_in user
      remember user
      redirect_to user
      flash[:success] = "Welcome #{user.full_name}"
    else
      flash.now[:alert] = "Invalid email and password combination"
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash[:success] = "Successfully logged out!"
  end
end
