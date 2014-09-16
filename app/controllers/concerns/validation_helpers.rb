module ValidationHelpers
    #TODO: Implement these

  def valid_params(params)
    valid_number?(params.fetch(:number, nil)) || valid_email?(params.fetch(:email, nil))
  end

  def valid_number?(number) #TODO: figure out how we do this on the front end for real
    return unless number
    number.gsub!("-", "")
    number.gsub!("/", "")
    number.length == 10
  end

  def valid_email?(email)
    return unless email
    email
  end
end