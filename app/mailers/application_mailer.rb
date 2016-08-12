class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: 'code9ty@lakehub.co.ke',
          bcc: 'stellamarisnjage@gamil.com',
          reply_to: 'sigumagwa@gmail.com'
  layout 'mailer'
end
