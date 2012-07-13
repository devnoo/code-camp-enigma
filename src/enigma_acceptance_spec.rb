require "rspec"
require "rspec-parameterized"
require "enigma"

describe "Enigma acceptance test" do

  before(:each) do
    @enigma = Enigma.new "MCK"
  end

  where(:originalMessage, :expectedEncodedMessage) do
    [
      ["E" , "Q" ] ,
      #["QMJIDO MZWZJFJR", "ENIGMA MACHINE"]
    ]
  end

  with_them do
    it "should do additions" do
      encodedMessage = @enigma.encode(originalMessage)
      encodedMessage.should == expectedEncodedMessage
      @enigma.reset()
      result = @enigma.decode(encodedMessage)
      result.should == originalMessage
    end
  end
end
