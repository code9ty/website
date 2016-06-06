module SessionsHelper
  #log in a user
  def log_in(user)
    session[:user_id] = user.id
    remember user
  end
  #returns currently logged in user if any
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
      end
    end
  end
  #returns true is user is logged in, false otherwise
  def logged_in?
    !current_user == nil?
  end
  #logs out a logged in user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #remember a user in persistent session
  def remember(user)
    user.remember # called remember method on user class
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #returns true is user passed equal to current user
  def current_user?(user)
    user == current_user
  end
end
