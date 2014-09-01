module Invites
  class Text < Base

    def send_message
      @client.account.calls.create({
        :from => @twilio_number, 
        :to => @partner_number,
        :body => "Take this questionnaire",
      }) 
    end

  end
end