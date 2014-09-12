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
    UserMailer.invite_partner(email) if email = args.fetch(:email, nil)
    Invites::Text.new(phone).send_message if phone = args.fetch(:number, nil)
  end

  private

  def create_actual_response_for_user
    ActualResponse.create!(user_id: self.id)
  end

  def partner_contact_info
    partner_email || partner_phone
  end

  def partner_email
    partner.email
  end

  def partner_phone
    partner.phone
  end

  def partner
    self.relationship.users.reject! {|user| user.id == self.id}
  end

end