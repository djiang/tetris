require './test/test_helper'

class PlayerTest < MiniTest::Unit::TestCase
  # Defaults to right side
  def test_next_move_blank
    field = Field.new
    piece = PieceO.new
    assert player = Player.new
    next_move = player.next_move(field, piece)

    assert_equal Move::LEFT, next_move.direction
    assert_equal 4, next_move.times
    assert_equal 19, next_move.deepest_row
  end

  def test_next_move_multiple_spots
    field_rows = []
    (Field::ROWS - 3).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,3,4,5,6,9])
    field_rows << Row.new([0,1,2,3,4,5,6,9])
    field_rows << Row.new([0,1,2,3,4,5,6,9])
    field = Field.new field_rows

    #           .
    #           .
    #           .
    # | | | | | | | | | | |
    # |X| | |X|X|X|X| | |X|
    # |X|X|X|X|X|X|X| | |X|
    # |X|X|X|X|X|X|X| | |X|
    # +-+-+-+-+-+-+-+-+-+-+

    piece = PieceO.new
    assert player = Player.new
    next_move = player.next_move(field, piece)

    assert_equal Move::RIGHT, next_move.direction
    assert_equal 3, next_move.times
    assert_equal 19, next_move.deepest_row

    field.apply_move(next_move, piece)

    #           .
    #           .
    #           .
    # | | | | | | | | | | |
    # |X| | |X|X|X|X| | |X|
    # +-+-+-+-+-+-+-+-+-+-+
    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X| | |X|X|X|X| | |X|\n+-+-+-+-+-+-+-+-+-+-+\n", field.display
  end
end