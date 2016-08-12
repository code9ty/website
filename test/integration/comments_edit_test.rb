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

  test "successful edit feedback" do
    log_in_as(@user)
    last_feedback = @user.comments.first
    assert_not last_feedback.nil?
    get edit_user_comment_path(@user)
    assert_template 'comments/edit'

  end
end
