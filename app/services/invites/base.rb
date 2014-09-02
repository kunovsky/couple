module Invites
  class Base
    def initialize(args)
      @partner_number, @twilio_number, @url = args.fetch(:number), "+18142976121", url(args.fetch(:invite_token))
    end

    private
    def remote_client
      @remote_client ||= Twilio::REST::Client.new APP_CONFIG[:twilio_account_sid], APP_CONFIG[:twilio_auth_token]
    end
    
    def url(invite_token)
      ['https://nijkdngprj.localtunnel.me', '/invite/', invite_token].join
    end
  end
end