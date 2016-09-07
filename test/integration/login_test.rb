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
  	
 
end
