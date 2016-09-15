require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_project" do
    user = users(:majaribu)
    mail = UserMailer.new_project user
    assert_equal "New Project", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["code9ty@lakehub.co.ke"], mail.from
    assert_match user.first_name,               mail.body.encoded
    assert_match CGI::escape(user.first_name), mail.body.encoded
  end
end
