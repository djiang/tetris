require './test/test_helper'

class SquareTest < MiniTest::Unit::TestCase
  def test_new_filled
    assert square = Square.filled
    assert square.filled?
    assert !square.unfilled?
  end

  def test_new_unfilled
    assert square = Square.unfilled
    assert !square.filled?
    assert square.unfilled?
  end

  def test_initialize
    assert square = Square.new
    assert !square.filled?
    assert square.unfilled?

    assert square = Square.new(Square::FILLED)
    assert square.filled?
    assert !square.unfilled?

    assert square = Square.new(Square::UNFILLED)
    assert !square.filled?
    assert square.unfilled?
  end

  def fill_and_clear
    assert square = Square.new
    assert square.unfilled?
    square.fill
    assert sqaure.filled?

    square.clear
    assert square.unfilled?
  end
end