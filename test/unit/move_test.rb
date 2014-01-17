require './test/test_helper'

class MoveTest < MiniTest::Unit::TestCase
  def test_initialize
    assert move = Move.new(0)
    assert_equal Move::LEFT, move.direction
    assert_equal 0, move.times
    assert_equal 0, move.deepest_row

    assert move = Move.new(Move::RIGHT, 3, 16)
    assert_equal Move::RIGHT, move.direction
    assert_equal 3, move.times
    assert_equal 16, move.deepest_row
  end

  def test_square_index
    assert move = Move.new(10)
    assert_equal 4, move.square_index

    assert move = Move.new(Move::LEFT, 5, 19)
    assert_equal 0, move.square_index

    assert move = Move.new(Move::RIGHT, 10, 3)
    assert_equal 9, move.square_index

    assert move = Move.new(Move::LEFT, 2, 6)
    assert_equal 2, move.square_index

    assert move = Move.new(Move::RIGHT, 3, 9)
    assert_equal 7, move.square_index
  end
end