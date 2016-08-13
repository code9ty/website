require 'test_helper'

class ApplicantMailerTest < ActionMailer::TestCase
  test "applicant_accept" do
    applicant = applicants(:majaribu)
    mail = ApplicantMailer.applicant_accept applicant
    assert_equal "Application Accepted", mail.subject
    assert_equal [applicant.email], mail.to
    assert_equal ["code9ty@lakehub.co.ke"], mail.from
    assert_match applicant.first_name,               mail.body.encoded
    assert_match CGI::escape(applicant.email), mail.body.encoded
  end

  test "application_request" do
    applicant = applicants(:majaribu)
    mail = ApplicantMailer.application_request applicant
    assert_equal "Application Request", mail.subject
    assert_equal [applicant.email], mail.to
    assert_equal ["code9ty@lakehub.co.ke"], mail.from
    assert_match applicant.first_name,               mail.body.encoded
    assert_match CGI::escape(applicant.first_name), mail.body.encoded
  end

end
