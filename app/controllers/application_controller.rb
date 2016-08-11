class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


  private

  def admin?
    if current_user
      redirect_to user_path(current_user) unless current_user.admin?
    else
      redirect_to login_path
    end
  end

  # redirects to login page if user is not logged in
  def logged_in_user
    unless logged_in?
      flash[:alert] = "You need to be logged in to view this page"
      redirect_to login_url
    end
  end



end
