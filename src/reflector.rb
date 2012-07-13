class Reflector
  def initialize
    @mapping = [
        [0, 24],
        [1, 17],
        [2, 20],
        [3, 7],
        [4, 16],
        [5, 18],
        [6, 11],
        [8, 15],
        [9, 23],
        [10, 13],
        [12, 14],
        [19, 25],
        [21, 22]
    ]
  end

  def reflect(input)
    @mapping.each do |key, value|
      if key == input
        return value
      end
      if value == input
        return key
      end
    end
  end
end