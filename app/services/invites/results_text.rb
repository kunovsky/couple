module Invites
  class ResultsText < Base

    def initialize(args)
      super args
      @url = url(args.fetch(:invite_token))
    end

    def send_message
      remote_client.account.messages.create({
        :from => @twilio_number, 
        :to => @partner_number,
        :body => "Your partner has finished the questionnaire. Here are your results #{@url}",
      })
      true
    end

    def url(invite_token)
      ['https://zeceagknbb.localtunnel.me', '/results/', invite_token].join
    end
  end
end