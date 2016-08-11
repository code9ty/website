class RequestMailer < ApplicationMailer

  def application_request(applicant)
    @applicant = applicant
    mail to: appplicant.email, subject: "Application Request"
  end
end
