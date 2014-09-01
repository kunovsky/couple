module Invites
  class Base
    def initialize(partner_number)
      @partner_number, @twilio_number = partner_number, "+18142976121"
    end

    private
    def remote_client
      @remote_client ||= Twilio::REST::Client.new APP_CONFIG[:twilio_account_sid], APP_CONFIG[:twilio_auth_token]
    end
  end
end