class PuppyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.puppy_mailer.todays_puppies.subject
  #
  def todays_puppies
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
