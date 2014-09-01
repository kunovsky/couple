class User < ActiveRecord::Base
  include UserHelpers
  has_many :completed_questionnaires
  has_one :actual_response
  belongs_to :relationship
  after_create :create_actual_response_for_user

  def text_user_invite_code
    
  end

  private

  def create_actual_response_for_user
    ActualResponse.create!(user_id: self.id)
  end


end