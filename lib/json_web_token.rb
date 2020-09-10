# # app/lib/json_web_token.rb
# class JsonWebToken
#   # secret to encode and decode token
#   HMAC_SECRET = 'somesecretkeyissuestakingplacehere'.freeze
# ​
#   def self.encode(payload, exp = 24.hours.from_now)
#     # set expiry to 24 hours from creation time
#     payload[:exp] = exp.to_i
#     # sign token with application secret
#     JWT.encode(payload, HMAC_SECRET)
#   end
# ​
#   def self.decode(token)
#     # get payload; first index in decoded Array
#     body = JWT.decode(token, HMAC_SECRET)[0]
#     HashWithIndifferentAccess.new body
#     # rescue from all decode errors
#   rescue JWT::DecodeError => e
#     # raise custom error to be handled by custom handler
#     raise ExceptionHandler::InvalidToken, e.message
#   end
# end

require 'jwt'

class JsonWebToken
  # Encodes and signs the payload (e.g. the user email) using our app's secret key
  # The result also includes the expiration date.
  def self.encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decode the JWT to get the user email
  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  end

  # Validates the payload hash for expiration and meta claims
  def self.valid_payload(payload)
    if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
      return false
    else
      return true
    end
  end

  # Default options to be encoded in the token
  def self.meta
    {
      exp: 7.days.from_now.to_i,
      iss: 'issuer_name',
      aud: 'client',
    }
  end

  # Validates if the token is expired by exp parameter
  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end
end 