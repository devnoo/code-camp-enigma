require "constants"

class Rotors


  def self.rotor1()
    Rotor.new(Constants::ALPHABET, "EKMFLGDQVZNTOWYHXUSPAIBRCJ", 'M')
  end

  def self.rotor2()
    Rotor.new(Constants::ALPHABET, "AJDKSIRUXBLHWTMCQGZNPYFVOE", 'C')
  end

  def self.rotor3()
    Rotor.new(Constants::ALPHABET, "BDFHJLCPRTXVZNYEIWGAKMUSQO", 'K')
  end

end