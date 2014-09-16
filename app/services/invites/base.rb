module Invites
  class Base
    def initialize(args)
      @partner_number, @twilio_number, @url = args.fetch(:number), twilio_number, url(args.fetch(:invite_token))
    end

    private
    def remote_client
      @remote_client ||= Twilio::REST::Client.new APP_CONFIG[:twilio_account_sid], APP_CONFIG[:twilio_auth_token]
    end

    def url(invite_token)
      ['https://zeceagknbb.localtunnel.me', '/invite/', invite_token].join
    end

    def twilio_number
      APP_CONFIG[:twilio_number]
    end
  end
end