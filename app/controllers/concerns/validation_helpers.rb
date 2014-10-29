module ValidationHelpers
    #TODO: Implement these
  def valid_params?(params)
    valid_number?(params.fetch(:text, nil)) || valid_email?(params.fetch(:email, nil))
  end

  def valid_number?(number)
    return unless number.present?
    number
  end

  def valid_email?(email)
    return unless email.present?
    email
  end
end