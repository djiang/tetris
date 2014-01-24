class Piece
  TYPES = ['I', 'J', 'L', 'O', 'S', 'T', 'Z']
  TYPE_I = TYPES[0]
  TYPE_O = TYPES[3]

  attr_reader :type

  def initialize(type = TYPE_O)
    @type = type
  end
end