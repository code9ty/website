require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get assignments_new_url
    assert_response :success
  end

end
