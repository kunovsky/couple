class Invite < ActiveRecord::Base
  include Tokens
  belongs_to :user
  before_validation -> { generate_token(:invite_token) }, on: :create
  validates_presence_of :invite_token

  # def self.has_users
  #   Invite.select(Invite[Arel.star]).joins(
  #     Invite.arel_table.join(User.arel_table).on(
  #       User[:email].eq(Invite[:email])
  #     ).join_sources
  #   )
  # end

  # def invite
  #   UserMailer.onboarding_invite(self.email).deliver
  # end

  # def user
  #   User.find_by(email: self.email)
  # end
end
