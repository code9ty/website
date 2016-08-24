require 'test_helper'

class LinksTest < ActionDispatch::IntegrationTest 
  def setup
    @admin = users(:majaribu)
    @user = users(:yulemzi)
  end

  test "links if visitor" do
    get root_path
    assert_select "a[href=?]", home_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", profiles_path

  end

  test "links if admin or member" do
    log_in_as(@admin)
    get root_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", dashboard_path
    assert_select "a[href=?]", bids_path
    assert_select "a[href=?]", projects_path
    assert_select "a[href=?]", edit_user_comment_path(@admin)
    assert_select "a[href=?]", feedback_path
    assert_select "a[href=?]", applicants_path

    
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", projects_path
    assert_select "a[href=?]", edit_user_comment_path(@user)
    assert_select "a[href=?]", feedback_path
  end
  
end
