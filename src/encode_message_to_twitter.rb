require 'rubygems'
require 'twitter'
require 'enigma'

Twitter.configure do |config|
  config.consumer_key = "ZjlgxEYbmnsasACcyPUFig"
  config.consumer_secret = "7BSbkG4D1Eod5MjrUruR2V6323gBgHhXztiB1xAH2w"
  config.oauth_token = "96138791-bd4GL8XfkNsm67BdQhPXGRzxoGxmz7pu7JOsnT4Dv"
  config.oauth_token_secret = "4PiaZyAahGI3trTBI6WBZPGtD6hGuymY5u0px1SBzw"
end


enigma = Enigma.new "MCK"
Twitter.update("@UDENigma Rotors: M, C, K Input: This is a test message Output: #{enigma.encode("This is a test message")}")