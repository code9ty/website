# Preview all emails at http://localhost:3000/rails/mailers/applicant_mailer
class ApplicantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicant_mailer/applicant_accept
  def applicant_accept
    applicant = Applicant.first
    ApplicantMailer.applicant_accept(applicant)
  end

end
