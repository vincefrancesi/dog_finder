class PuppyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.puppy_mailer.todays_puppies.subject
  #
  def todays_puppies(user)
    @websites = Website.all
    mail(to: "#{user.name} <#{user.email}>")
  end
end
