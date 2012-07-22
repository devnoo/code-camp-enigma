require 'rubygems'
require 'twitter'
require 'enigma'

Twitter.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_TOKEN_SECRET
end


enigma = Enigma.new "MCK"
Twitter.update("@UDENigma Rotors: M, C, K Input: This is a test message Output: #{enigma.encode("This is a test message")}")