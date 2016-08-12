require 'test_helper'

class ApplicantMailerTest < ActionMailer::TestCase
  test "applicant_accept" do
    mail = ApplicantMailer.applicant_accept
    assert_equal "Applicant accept", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "application_request" do
    mail = ApplicantMailer.application_request
    assert_equal "Application request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
