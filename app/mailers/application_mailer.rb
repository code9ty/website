class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: 'code9ty@lakehub.co.ke',
          bcc: 'sigu@lakehub.co.ke'
  layout 'mailer'
end
