require "reflector"
require "rotors"
require "constants"

class Enigma

  attr_accessor :leftRotor, :centerRotor, :rightRotor, :reflector


  def initialize(initialSetting)
    @leftRotor = Rotors.rotor1
    @centerRotor = Rotors.rotor2
    @rightRotor = Rotors.rotor3
    @reflector = Reflector.new
  end

  def reset()
    @leftRotor.reset()
    @rightRotor.reset()
    @centerRotor.reset()
  end

  def encode(message)
    @rightRotor.rotate()
    alphabet_index = Constants::ALPHABET.index(message)
    puts alphabet_index
    signalFromRotor1 = @rightRotor.signalRightToLeft(alphabet_index)
    puts "signalFromRightRotor:  #{signalFromRotor1}"
    signalFromRotor2 = @centerRotor.signalRightToLeft(signalFromRotor1)
    puts "signalFromCenterRotor:  #{signalFromRotor2}"
    signalFromRotor3 = @leftRotor.signalRightToLeft(signalFromRotor2)
    puts "signalFromLeftRotor:  #{signalFromRotor3}"
    reflectedSignal = @reflector.reflect(signalFromRotor3)
    puts "reflectedsignal:  #{reflectedSignal}"
    signalBackFromLeftRotor = @leftRotor.signalLeftToRight(reflectedSignal)
    puts "leftrotorback:  #{signalBackFromLeftRotor}"
    signalBackFromCenterRotor = @centerRotor.signalLeftToRight(signalBackFromLeftRotor)
    puts "centerrotorback:  #{signalBackFromCenterRotor}"
    signalBackFromRightRotor = @rightRotor.signalLeftToRight(signalBackFromCenterRotor)
    puts "rightrotorback:  #{signalBackFromRightRotor}"

    return  Constants::ALPHABET[signalBackFromRightRotor].chr
  end

  def decode(message)
    encode(message)
  end


end