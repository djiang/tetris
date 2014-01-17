require './lib/field'
require './lib/piece'
require './lib/player'

class Tetris
  attr_reader :field

  def initialize(field = Field.new)
    @field = field
    @player = Player.new
  end

  def display
    @field.display
  end

  def step(piece = Piece.new)
    move = @player.next_move(@field, piece)
    @field.apply_move(move, piece)
  end
end