module Invites
  class Text < Base

    def send_message
      remote_client.account.messages.create({
        :from => @twilio_number, 
        :to => @partner_number,
        :body => "take this questionnaire- #{@code}",
        # :StatusCallback => "url for success"
      })
      true
    end

  end
end