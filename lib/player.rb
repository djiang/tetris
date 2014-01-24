require './lib/move'

class Player
  def next_move(field, piece)
    deepest_row = 0
    left_most_square = 0

    field.rows.each_with_index do |row, row_i|
      break if row_i == Field::ROWS - 1
      next_row = field.rows[row_i + 1]

      if lms = piece.placement([row, next_row])
        left_most_square = lms
        deepest_row = row_i + 1
      end
    end

    direction, times = piece.offset(left_most_square)

    Move.new(direction, times, deepest_row)
  end
end