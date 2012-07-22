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
    result = ""
    message.each_char do |char|
      result << encodeChar(char)
    end
    result
  end


  def encodeChar(characterToEncode)
    if (characterToEncode == " ")
      return ""
    end
    puts "char to encode : #{characterToEncode}"
    @rightRotor.rotate {@centerRotor.rotate {@rightRotor.rotate }}
    signalFromRotor1 = @rightRotor.signalRightToLeft(Constants::ALPHABET.index(characterToEncode.capitalize))
    signalFromRotor2 = @centerRotor.signalRightToLeft(signalFromRotor1)
    signalFromRotor3 = @leftRotor.signalRightToLeft(signalFromRotor2)
    reflectedSignal = @reflector.reflect(signalFromRotor3)
    signalBackFromLeftRotor = @leftRotor.signalLeftToRight(reflectedSignal)
    signalBackFromCenterRotor = @centerRotor.signalLeftToRight(signalBackFromLeftRotor)
    signalBackFromRightRotor = @rightRotor.signalLeftToRight(signalBackFromCenterRotor)
    Constants::ALPHABET[signalBackFromRightRotor].chr
  end

  def decode(message)
    encode(message)
  end


end