class PieceO
  WIDTH = 2
  HEIGHT = 2

  def type
    Piece::TYPE_O
  end

  def placement(rows)
    row = rows[0]
    next_row = rows[1]

    row.squares.each_with_index do |square, square_i|
      next if square_i == Row::SQUARES - 1
      next_square = row.squares[square_i + 1]

      if square.unfilled? && next_square.unfilled?
        if next_row.squares[square_i].unfilled? && next_row.squares[square_i + 1].unfilled?
          return square_i
        end
      end
    end

    return nil
  end

  def offset(left_most_square)
    if left_most_square < 5
      [Move::LEFT, 4 - left_most_square]
    else
      [Move::RIGHT, left_most_square - 4]
    end
  end
end