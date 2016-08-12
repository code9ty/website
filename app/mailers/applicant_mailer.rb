class ApplicantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.applicant_accept.subject
  #
  def applicant_accept(applicant)
    @applicant = applicant
    mail to: applicant.email, subject: "Application Accepted"
  end
  def application_request(applicant)
    @applicant = applicant
    mail to: appplicant.email, subject: "Application Request"
  end
end
