class Piece
  TYPES = ['I', 'J', 'L', 'O', 'S', 'T', 'Z']
  TYPE_O = TYPES[3]

  attr_reader :type

  def initialize
    @type = TYPE_O
  end
end