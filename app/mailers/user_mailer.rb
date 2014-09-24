class UserMailer < ActionMailer::Base
  include Sidekiq::Mailer
  default from: "Ranalytics <tyson@test.com>"

  def invite_partner(args)
    @invite_token = args[:invite_token]
    mail(to: args[:email], subject: "Your partner wants to you to take this relationship questionnaire")
  end

  def send_finished_notification(args)
    @invite_token = args[:invite_token]
    mail(to: args[:email], subject: "Your partner has finished the questionnaire and your results are ready")
  end
end