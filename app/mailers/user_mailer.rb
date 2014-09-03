class UserMailer < ActionMailer::Base
  include Sidekiq::Mailer
  default from: "Ranalytics <tyson@test.com>"

  def invite_partner(args)
    p "$$$$$$$$$$$$$$$"
    @invite_token = args[:invite_token]
    mail(to: args[:email], subject: "Your partner wants to you to take this relationship questionnaire")
  end
end
