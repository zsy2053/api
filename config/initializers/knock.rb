Knock.setup do |config|

  ## Expiration claim
  ## ----------------
  ##
  ## How long before a token is expired.
  ##
  ## Default:
  config.token_lifetime = 1.days

  config.token_audience = -> { Rails.application.secrets.auth0_client_id }
  config.token_secret_signature_key = -> { JWT.base64url_decode Rails.application.secrets.auth0_client_secret }

  ## Audience claim
  ## --------------
  ##
  ## Configure the audience claim to identify the recipients that the token
  ## is intended for.
  ##
  ## Default:
  # config.token_audience = nil

  ## Signature algorithm
  ## -------------------
  ##
  ## Configure the algorithm used to encode the token
  ##
  ## Default:
  # config.token_signature_algorithm = 'HS256'

  ## Signature key
  ## -------------
  ##
  ## Configure the key used to sign tokens.
  ##
  ## Default:
  # config.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }

  ## Public key
  ## ----------
  ##
  ## Configure the public key used to decode tokens, if required.
  ##
  ## Default:
  # config.token_public_key = nil
end

# Knock.resource = :auth
# Knock.handle_attr = :email
