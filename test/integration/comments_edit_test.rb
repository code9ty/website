require 'test_helper'

class CommentsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:majaribu)
  end

  test "redirect edit of nonexistent feedback" do
    log_in_as(@user)
    last_feedback = @user.comments.first
    assert last_feedback.nil?
    assert_redirected_to @user
    assert_not flash.empty?
  end
end
