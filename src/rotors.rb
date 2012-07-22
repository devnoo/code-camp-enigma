require "constants"
require "rotor"

class Rotors


  def self.rotor1()
    Rotor.new(Constants::ALPHABET, "EKMFLGDQVZNTOWYHXUSPAIBRCJ", 'M', "Q")
  end

  def self.rotor2()
    Rotor.new(Constants::ALPHABET, "AJDKSIRUXBLHWTMCQGZNPYFVOE", 'C', "E")
  end

  def self.rotor3()
    Rotor.new(Constants::ALPHABET, "BDFHJLCPRTXVZNYEIWGAKMUSQO", 'K', "V")
  end

end