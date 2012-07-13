require "rspec"
require "rotor"
require "rspec-parameterized"
require "rotors"

describe "Rotor -Encode and decode signal" do


  where(:inputLetter, :leftPosition, :rightPosition) do
    [
        ["E", 20, 5],
        ["D", 19, 17],
        ["F", 21, 18],
        ["Z", 15, 2]

    ]
  end

  with_them do

    it "should send a signal from right to left" do
      Rotors.rotor3.signalRightToLeft(rightPosition).should == leftPosition
      end

    it "should send a signal from left to right" do
      Rotors.rotor3.signalLeftToRight(leftPosition).should == rightPosition
    end
  end


end