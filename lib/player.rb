require './lib/move'

class Player
  def next_move(field, piece)
    deepest_row = 0
    left_most_square = 0

    field.rows.each_with_index do |row, row_i|
      row.squares.each_with_index do |square, square_i|
        next if square_i == Row::SQUARES - 1
        next_square = row.squares[square_i + 1]

        case piece.type
        when Piece::TYPE_O
          if square.unfilled? && next_square.unfilled?
            deepest_row = row_i
            left_most_square = square_i
            break
          end
        end
      end
    end

    case piece.type
    when Piece::TYPE_O
      if left_most_square < 5
        direction = Move::LEFT
        times = 4 - left_most_square
      else
        direction = Move::RIGHT
        times = left_most_square - 4
      end
    end

    Move.new(direction, times, deepest_row)
  end
end