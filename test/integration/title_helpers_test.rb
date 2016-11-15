require 'test_helper'

class TitleHelpersTest < ActionDispatch::IntegrationTest
  def setup
    @common_title = "#Code9ty"
    @user = users(:majaribu)
    @user2 = users(:yulemzi)
  end

  test "home title" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@common_title}"
  end

  test "title when on what we learn page" do
    get what_we_learn_path
    assert_response :success
    assert_select "title", "What we learn | #{@common_title}"
  end

  test "title when on login page" do
    get login_path
    assert_response :success
    assert_select "title", "Login | #{@common_title}"
  end

  test "title when on feedback page" do
    log_in_as(@user2)
    get feedback_path
    assert_response :success
    assert_select "title", "Feedback | #{@common_title}"
  end

  test "page title when editing feedback" do
    log_in_as(@user2)
    get edit_user_comment_path(@user)
    assert_response :success
    assert_select "title", "Edit feedback | #{@common_title}"
  end

  test "page title when on dashboard" do
    log_in_as(@user)
    get dashboard_path
    assert_response :success
    assert_select "title", "Dashboard | #{@common_title}"
  end

  test "page title when on applicants page" do
    log_in_as(@user)
    get applicants_path
    assert_response :success
    assert_select "title", "Applicants | #{@common_title}"
  end

  test "page title when on profiles page" do
    get profiles_path
    assert_response :success
    assert_select "title", "Profiles | #{@common_title}"
  end

  test "page title when on users page" do
    log_in_as(@user)
    get users_path
    assert_select "title", "Users | #{@common_title}"
  end
end
