require './lib/row'

class Field
  ROWS = 20

  attr_reader :rows

  def initialize(rows = [])
    @rows = rows
    ROWS.times do
      @rows << Row.new
    end if rows.empty?
  end

  def display
    output =  "+-+-+-+-+-+-+-+-+-+-+\n"
    @rows.each do |row|
      output << '|'
      row.squares.each do |square|
        output << (square.filled? ? 'X' : ' ')
        output << '|'
      end
      output << "\n"
    end
    output << "+-+-+-+-+-+-+-+-+-+-+\n"
  end

  def apply_move(move, piece)
    case piece.type
    when Piece::TYPE_O
      @rows[move.deepest_row].squares[move.square_index].fill
      @rows[move.deepest_row].squares[move.square_index + 1].fill
      @rows[move.deepest_row - 1].squares[move.square_index].fill
      @rows[move.deepest_row - 1].squares[move.square_index + 1].fill
    end

    clear_full_rows
  end

  private

  def clear_full_rows
    @rows.each do |row|
      if row.squares.map(&:filled?).uniq == [Square::FILLED]
        @rows.delete(row)
        @rows.unshift(Row.new)
      end
    end
  end
end