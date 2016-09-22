require 'test_helper'

class NewAssignmentTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:majaribu)
    @user = users(:yulemzi)
  end
  test 'non admin cannot create an assignment' do
    log_in_as(@user)
    get new_assignment_url
    assert_difference 'Assignment.count', 0 do
      post assignments_path, params:{
        assignment:
        {
          title: "Learn Ruby Hard Way",
          description: "Do all the exercises",
          link: "https://learnrubythehardway.com",
          due_date: "2016-09-17 08:12:29 UTC ",
          start_date: "2016-10-17 08:12:29 UTC"
        }
      }
    end
  end

  test "new assignment including new delivery " do
    log_in_as(@admin)
    get new_assignment_url
    assert_difference 'Assignment.count', 1 do
      post assignments_path, params:{
        assignment:
        {
          title: "Learn Ruby Hard Way",
          description: "Do all the exercises",
          link: "https://learnrubythehardway.com",
          due_date: "2016-09-17 08:12:29 UTC ",
          start_date: "2016-10-17 08:12:29 UTC"
        }
      }
    end
    assert_redirected_to new_assignment_path
    follow_redirect!
    assert_template 'new'
    assert_not flash.empty?
    assert_equal User.count , ActionMailer::Base.deliveries.size
  end
end
