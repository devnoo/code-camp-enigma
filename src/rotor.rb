
class Rotor
  attr_reader :notchPosition

  def initialize(leftColumn, rightColumn, initialLetter, notchLetter)
     @rightColumn = rightColumn
     @leftColumn = leftColumn
     @initialPosition = @leftColumn.index(initialLetter)
     @currentPosition = @initialPosition
     @notchPosition = @leftColumn.index(notchLetter)
  end

  def reset()
    @currentPosition = @initialPosition
  end


  def rotate(&notchPassedAction)
    @currentPosition = @currentPosition + 1
    if (@currentPosition > 25)
      @currentPosition == 0
    end
    if (notchPosition == @currentPosition - 1)
      notchPassedAction.call(self)
    end
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