require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:majaribu)
  end

  test "should get index" do
    log_in_as(@admin)
    get projects_path
    assert_response :success
  end

end
