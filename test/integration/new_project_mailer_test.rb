require 'test_helper'

class NewProjectMailerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:majaribu)
  end
  test "new project creation with mail delivery" do
    log_in_as(@admin)
    get new_project_url
    assert_difference 'Project.count', 1 do
      post projects_path, params:{ project: {link: "http://github.com/sigu/project1",
                                                          title: "Library Project",
                                                          due_date: "2016-09-17 08:12:29 UTC ",
                                                          start_date: "2016-10-17 08:12:29 UTC"
      } }
    end
    assert_redirected_to projects_path
    follow_redirect!
    assert_template 'index'
    assert_not flash.empty?
    assert_equal User.count , ActionMailer::Base.deliveries.size
  end
end
