require "rails_helper"

RSpec.describe ApplicantMailerMailer, type: :mailer do
  describe "applicant_accept" do
    let(:mail) { ApplicantMailerMailer.applicant_accept }

    it "renders the headers" do
      expect(mail.subject).to eq("Applicant accept")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
