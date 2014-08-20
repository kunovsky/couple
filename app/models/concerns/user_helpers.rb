module UserHelpers
  extend ActiveSupport::Concern
  included do
    include Tokens
    before_validation -> { generate_token(:auth_token) }, on: :create
  end
end