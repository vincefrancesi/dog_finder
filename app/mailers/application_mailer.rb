class ApplicationMailer < ActionMailer::Base
  default from: ENV['email_from_address']
  layout 'mailer'
end
