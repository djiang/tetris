require './lib/square'

class Row
  SQUARES = 10

  attr_reader :squares

  def initialize(fill_indexes = [])
    @squares = []
    SQUARES.times do
      @squares << Square.new
    end
    fill fill_indexes
  end

  def fill(indexes = [])
    indexes.each do |i|
      next if i >= SQUARES
      @squares[i].fill
    end
  end
end