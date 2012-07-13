require "rspec"
require "rspec-parameterized"
require "enigma"

describe "Enigma acceptance test" do

  before(:each) do
    @enigma = Enigma.new "MCK"
  end

  where(:originalMessage, :expectedEncodedMessage, :expectedDecodedMessage) do
    [
      ["E" , "Q", "E"] ,
      ["ENIGMA", "QMJIDO",  "ENIGMA"] ,
      ["ENIGMA REVEALED", "QMJIDOMZWZJFJR", "ENIGMAREVEALED"]
      #["QMJIDO MZWZJFJR", "ENIGMA MACHINE"]
    ]
  end

  with_them do
    it "should encode and decode the message" do
      encodedMessage = @enigma.encode(originalMessage)
      encodedMessage.should == expectedEncodedMessage
      @enigma.reset()
      result = @enigma.decode(encodedMessage)
      result.should == expectedDecodedMessage
    end
  end
end
