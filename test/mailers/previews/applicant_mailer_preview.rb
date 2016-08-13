# Preview all emails at http://localhost:3000/rails/mailers/applicant_mailer
class ApplicantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/applicant_accept
  def setup
    @applicant = applicants(:majaribu)
  end

  def applicant_accept
    ApplicantMailer.applicant_accept(@applicant)
  end

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/application_request
  def application_request
    ApplicantMailer.application_request(@applicant)
  end

end
