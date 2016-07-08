class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


  private

  def is_admin
    redirect_to root_url unless current_user.admin?
  end

  # redirects to login page if user is not logged in
  def logged_in_user
    unless logged_in?
      flash[:alert] = "You need to be logged in to view this page"
      redirect_to login_url
    end
  end

end
