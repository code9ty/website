require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:majaribu)
  end
  test "should get new" do
    log_in_as(@user)
    get new_assignment_path
  end

end
