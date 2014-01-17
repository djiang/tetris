class Square
  FILLED = true
  UNFILLED = false

  class << self
    def filled
      self.new(FILLED)
    end

    def unfilled
      self.new
    end
  end

  def initialize(filled = UNFILLED)
    @filled = filled
  end

  def filled?
    @filled == FILLED
  end

  def unfilled?
    @filled == UNFILLED
  end

  def fill
    @filled = FILLED
  end

  def clear
    @filled = UNFILLED
  end
end