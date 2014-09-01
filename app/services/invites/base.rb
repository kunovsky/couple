module Invites
  class Base
    def initialize(args)
      @partner_number, @twilio_number, @code = args.fetch(:number), "+18142976121", args.fetch(:code)
    end

    private
    def remote_client
      @remote_client ||= Twilio::REST::Client.new APP_CONFIG[:twilio_account_sid], APP_CONFIG[:twilio_auth_token]
    end
  end
end