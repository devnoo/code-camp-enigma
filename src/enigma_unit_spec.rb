require "rspec"
#require "rspec-mocks"

require "enigma"

describe "Enigma unit test" do

  before(:each) do
    @enigma = Enigma.new "MCK"
    @leftRotor = double("rotor1")
    @centerRotor = double("rotor2")
    @rightRotor = double("rotor3")
    @reflector = double("reflector")
    @enigma.leftRotor= @leftRotor
    @enigma.centerRotor= @centerRotor
    @enigma.rightRotor= @rightRotor
    @enigma.reflector= @reflector
  end


  it "should encode a simple letter, by calling the rotors and reflector" do
    @rightRotor.should_receive(:rotate)

    @rightRotor.should_receive(:signalRightToLeft).with(4).and_return(20)
    @centerRotor.should_receive(:signalRightToLeft).with(20).and_return(14)
    @leftRotor.should_receive(:signalRightToLeft).with(14).and_return(10)

    @reflector.should_receive(:reflect).with(10).and_return(22)

    @leftRotor.should_receive(:signalLeftToRight).with(22).and_return(15)
    @centerRotor.should_receive(:signalLeftToRight).with(15).and_return(20)
    @rightRotor.should_receive(:signalLeftToRight).with(20).and_return(16)

    @enigma.encode("E").should == "Q"
  end
end
