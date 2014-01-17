require './test/test_helper'

class FieldTest < MiniTest::Unit::TestCase
  def test_initialize
    assert field = Field.new
    field.rows.each do |row|
      row.squares.each do |square|
        assert square.unfilled?
      end
    end

    field_rows = []
    (Field::ROWS - 2).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,3,4,5,6])
    field_rows << Row.new([0,3,4,5,6])
    field = Field.new field_rows

    field.rows.each_with_index do |row, r|
      row.squares.each_with_index do |square, s|
        assert_equal field_rows[r].squares[s].filled?, square.filled?
      end
    end
  end

  def test_display
    field = generate_field

    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X| | |X|X|X|X| | | |\n|X| | |X|X|X|X| | | |\n|X| | |X|X|X|X| | | |\n+-+-+-+-+-+-+-+-+-+-+\n", field.display
  end

  def test_apply_move
    field = generate_field

    move = Move.new(Move::RIGHT, 4, 19)
    piece = Piece.new
    field.apply_move(move, piece)

    #           .
    #           .
    #           .
    # | | | | | | | | | | |
    # |X| | |X|X|X|X| | | |
    # |X| | |X|X|X|X| |X|X|
    # |X| | |X|X|X|X| |X|X|
    # +-+-+-+-+-+-+-+-+-+-+


    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X| | |X|X|X|X| | | |\n|X| | |X|X|X|X| |X|X|\n|X| | |X|X|X|X| |X|X|\n+-+-+-+-+-+-+-+-+-+-+\n", field.display
  end

  def test_apply_move_and_clear_full_rows
    field_rows = []
    (Field::ROWS - 3).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,3,6,7,8,9])
    field_rows << Row.new([0,1,2,3,6,7,8,9])
    field_rows << Row.new([0,1,2,3,6,7,8,9])
    field = Field.new field_rows

    #           .
    #           .
    #           .
    # | | | | | | | | | | |
    # |X| | |X| | |X|X|X|X|
    # |X|X|X|X| | |X|X|X|X|
    # |X|X|X|X| | |X|X|X|X|
    # +-+-+-+-+-+-+-+-+-+-+

    move = Move.new(Move::LEFT, 0, 19)
    piece = Piece.new
    field.apply_move(move, piece)

    #           .
    #           .
    #           .
    # | | | | | | | | | | |
    # |X| | |X| | |X|X|X|X|
    # +-+-+-+-+-+-+-+-+-+-+
    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X| | |X| | |X|X|X|X|\n+-+-+-+-+-+-+-+-+-+-+\n", field.display
  end

  private

  #           .
  #           .
  #           .
  # | | | | | | | | | | |
  # |X| | |X|X|X|X| | | |
  # |X| | |X|X|X|X| | | |
  # |X| | |X|X|X|X| | | |
  # +-+-+-+-+-+-+-+-+-+-+
  def generate_field
    field_rows = []
    (Field::ROWS - 3).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,3,4,5,6])
    field_rows << Row.new([0,3,4,5,6])
    field_rows << Row.new([0,3,4,5,6])
    Field.new field_rows
  end
end