class Move
  LEFT = 'left'
  RIGHT = 'right'

  attr_reader :direction, :times, :deepest_row

  def initialize(direction = LEFT, times = 0, deepest_row)
    @direction = direction
    @times = times
    @deepest_row = deepest_row
  end

  def square_index
    if @direction == LEFT
      index = 4 - @times
      [index, 0].max
    else
      index = 4 + @times
      [index, 9].min
    end
  end
end