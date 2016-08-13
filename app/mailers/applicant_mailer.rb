class ApplicantMailer < ApplicationMailer

  def applicant_accept(applicant)
    @applicant = applicant
    mail to: applicant.email, subject: "Application Accepted"
  end

  def application_request(applicant)
    @applicant = applicant
    mail to: applicant.email, subject: "Application Request"
  end
end
