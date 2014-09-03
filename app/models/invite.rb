class Invite < ActiveRecord::Base
  include Tokens
  belongs_to :user
  before_validation -> { generate_token(:invite_token) }, on: :create
  validates_presence_of :invite_token
end
