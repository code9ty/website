require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:majaribu)
  end

  test "current_user cannot login"  do
    log_in_as(@user)
    get login_path
    assert_redirected_to root_url
    assert_not flash.empty?
  end

  test "user login in" do
    get login_path
    assert_template "sessions/new"
    assert flash.empty?
    post login_path, params: {
      session: {
        email: @user.email,
        password: 'password' 
      }
    }
    assert_not flash.empty?
    assert_equal flash[:success], "Welcome #{@user.full_name}"
    assert_redirected_to @user
    
  end



end
