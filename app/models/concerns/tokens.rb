module Tokens
  extend ActiveSupport::Concern
  def generate_token(column, length = nil)
    begin
      self[column] = SecureRandom.urlsafe_base64(length)
    end while self.class.where(column => self[column]).exists?
  end
end