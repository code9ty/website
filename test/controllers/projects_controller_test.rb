require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:majaribu)
  end

  test "should get index" do
    log_in_as(@user)
    get projects_path
    assert_response :success
  end

end
