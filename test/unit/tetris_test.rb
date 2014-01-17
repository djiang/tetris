require './test/test_helper'

class TetrisTest < MiniTest::Unit::TestCase
  def test_initialize
    field = Field.new()
    assert tetris = Tetris.new(field)
    assert_equal field, tetris.field
  end

  def test_display
    field = generate_field

    tetris = Tetris.new(field)
    assert_equal field.display, tetris.display
  end

  def test_steps_blank
    tetris = Tetris.new

    3.times do
      assert tetris.step
    end

    #           .
    #           .
    #           .
    # | | | | | | | | | | |
    # |X|X|X|X|X|X| | | | |
    # |X|X|X|X|X|X| | | | |
    # +-+-+-+-+-+-+-+-+-+-+
    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X|X|X|X|X|X| | | | |\n|X|X|X|X|X|X| | | | |\n+-+-+-+-+-+-+-+-+-+-+\n", tetris.display

    2.times do
      assert tetris.step
    end

    assert_equal Field.new.display, tetris.display
  end

  def test_steps_not_blank
    field = generate_field
    tetris = Tetris.new(field)

    3.times do
      assert tetris.step
    end

    #           .
    #           .
    #           .
    # | |X|X| | | | |X|X| |
    # +-+-+-+-+-+-+-+-+-+-+
    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| |X|X| | | | |X|X| |\n+-+-+-+-+-+-+-+-+-+-+\n", tetris.display
  end

  private

  def generate_field
    field_rows = []
    (Field::ROWS - 3).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,3,4,5,6,9])
    field_rows << Row.new([0,1,2,3,4,5,6,9])
    field_rows << Row.new([0,1,2,3,4,5,6,9])
    Field.new field_rows
  end
end