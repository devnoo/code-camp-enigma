class Rotor
  def initialize(leftColumn, rightColumn, initialLetter)
     @rightColumn = rightColumn
     @leftColumn = leftColumn
     @initialPosition = @leftColumn.index(initialLetter)
     @currentPosition = @initialPosition
  end

  def reset()
    @currentPosition = @initialPosition
  end

  def rotate()
    @currentPosition = @currentPosition + 1
  end
  
  def leftPosition(non_rotated_position)
    (non_rotated_position - @currentPosition).modulo(26)
  end

  def rightPosition(non_rotated_position)
    (non_rotated_position + @currentPosition ).modulo(26)
  end

  def signalRightToLeft(rightPosition)
    leftPosition(@leftColumn.index(@rightColumn[rightPosition(rightPosition)]))
  end

  def signalLeftToRight(leftPosition)
    leftPosition(@rightColumn.index(@leftColumn[rightPosition(leftPosition)]))
  end
end