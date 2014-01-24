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

  def test_offset_rows
    #           .
    #           .
    #           .
    # |X|X|X|X|X|X|X|X| | |
    # |X|X|X|X|X|X| | | | |
    # +-+-+-+-+-+-+-+-+-+-+

    field_rows = []
    (Field::ROWS - 2).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,1,2,3,4,5,6,7,])
    field_rows << Row.new([0,1,2,3,4,5])
    field = Field.new field_rows

    tetris = Tetris.new(field)

    tetris.step

    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X|X|X|X|X|X| | |X|X|\n+-+-+-+-+-+-+-+-+-+-+\n", tetris.display
  end

  def test_offset_rows2
    #           .
    #           .
    #           .
    # |X|X|X|X|X|X|X|X|X| |
    # |X|X|X|X|X|X|X| | | |
    # +-+-+-+-+-+-+-+-+-+-+

    field_rows = []
    (Field::ROWS - 2).times do
      field_rows << Row.new
    end
    field_rows << Row.new([0,1,2,3,4,5,6,7,8])
    field_rows << Row.new([0,1,2,3,4,5,6])
    field = Field.new field_rows

    tetris = Tetris.new(field)
    tetris.step
    assert_equal "+-+-+-+-+-+-+-+-+-+-+\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n|X|X| | | | | | | | |\n|X|X| | | | | | | | |\n|X|X|X|X|X|X|X|X|X| |\n|X|X|X|X|X|X|X| | | |\n+-+-+-+-+-+-+-+-+-+-+\n", tetris.display
  end

  private

  # |X| | |X|X|X|X| | |X|
  # |X|X|X|X|X|X|X| | |X|
  # |X|X|X|X|X|X|X| | |X|
  # +-+-+-+-+-+-+-+-+-+-+

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