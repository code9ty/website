require 'test_helper'

class CommentsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:yulemzi)
    @user2 = users(:einstein)
    @comment = comments(:comment1)
  end

  test "redirect edit of nonexistent feedback" do
    log_in_as(@user2)
    last_feedback = @user2.comments.first
    assert last_feedback.nil?
    assert_redirected_to @user2
    assert_not flash.empty?
  end

  test "successful edit feedback" do
    log_in_as(@user)
    last_feedback = @comment
    assert_not last_feedback.nil?
    get edit_user_comment_path(@user)
    assert_template 'comments/edit'

  end
end
