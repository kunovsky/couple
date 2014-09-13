class User < ActiveRecord::Base
  include UserHelpers
  has_many :completed_questionnaires
  has_one :actual_response
  has_one :invite
  belongs_to :relationship
  after_create :create_actual_response_for_user

  def invite_via_text(args)
    Invites::Text.new(args).send_message
  end

  def invite_via_email(args)
    UserMailer.invite_partner(args)
  end

  def already_taken
    self.taken
  end

  def handle_partner_notification(args)
    Invites::ResultsText.new(args).send_message if args.fetch(:number, nil)
    UserMailer.invite_partner(args) if args.fetch(:email, nil)
  end

  def partner_contact_info
    partner_email || partner_phone
  end

  def partner
    self.relationship.users.select {|user| user.id != self.id}.first
  end

  def partner_email
    partner.email
  end

  def partner_phone
    partner.phone
  end

  private

  def create_actual_response_for_user
    ActualResponse.create!(user_id: self.id)
  end

end