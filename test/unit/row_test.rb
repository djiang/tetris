require './test/test_helper'

class RowTest < MiniTest::Unit::TestCase
  def test_initialize
    assert row = Row.new
    assert_equal Row::SQUARES, row.squares.size
    assert_equal [true], row.squares.map(&:unfilled?).uniq
  end

  def test_fill_and_clear
    [
      [0,1,2,3,4,5,6,7,8,9,10,11],
      [0,1,2],
      [0,2,4,6,8],
      [5,6,7,8],
      [2,5,7]
    ].each do |indexes|
      row = Row.new
      row.fill(indexes)
      expected_row = Array.new(Row::SQUARES, false)
      indexes.each do |i|
        next if i >= Row::SQUARES
        expected_row[i] = true
      end
      assert_equal expected_row, row.squares.map(&:filled?)
    end
  end
end