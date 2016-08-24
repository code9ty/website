require 'test_helper'

class TitleHelpersTest < ActionDispatch::IntegrationTest
  def setup
    @common_title = "#Code9ty"
  end

  test "home title" do
    get home_path
    assert_response :success
    assert_select "title", "Home | #{@common_title}"
  end
end
