class ApplicationController < ActionController::API

  include Knock::Authenticable

  # def user_id
  #   if decoded_token
  #     decoded_token[0]["user_id"]
  #   end
  # end
end
