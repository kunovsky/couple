module Invites
  class Text < Base

    def send_message
      remote_client.account.messages.create({
        :from => @twilio_number, 
        :to => @partner_number,
        :body => "Take this test to see how your relationship is doing #{@url}",
      #   # :StatusCallback => "url for success"
      })
      true
    end

  end
end