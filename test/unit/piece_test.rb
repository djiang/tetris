require './test/test_helper'

class PieceTest < MiniTest::Unit::TestCase
  def test_initialize
    assert piece = Piece.new
    assert_equal Piece::TYPE_O, piece.type
  end
end