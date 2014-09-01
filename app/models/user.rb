class User < ActiveRecord::Base
  include UserHelpers
  has_many :completed_questionnaires
  has_one :actual_response
  belongs_to :relationship
  after_create :create_actual_response_for_user

  def invite_via_text(args)
    Invites::Text.new(args).send_message
  end

  def invite_via_email

    return true
  end

  def already_taken
    self.taken
  end

  private

  def create_actual_response_for_user
    ActualResponse.create!(user_id: self.id)
  end

end