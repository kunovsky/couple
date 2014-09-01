module Invites
  class Text < Base

    def send_message
      remote_client.account.messages.create({
        :from => @twilio_number, 
        :to => @partner_number,
        :body => "Take this to see how your relationship is doing 192.168.1.128:3000/invite/#{@code}",
      #   # :StatusCallback => "url for success"
      })
      true
    end

  end
end