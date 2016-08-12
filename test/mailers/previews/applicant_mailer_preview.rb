# Preview all emails at http://localhost:3000/rails/mailers/applicant_mailer
class ApplicantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/applicant_accept
  def applicant_accept
    applicant = Applicant.first
    ApplicantMailer.applicant_accept(applicant)
  end

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/application_request
  def application_request
    ApplicantMailer.application_request(Applicant.first)
  end

end
