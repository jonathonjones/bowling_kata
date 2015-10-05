# Represent a game of bowling
class Game
  attr_reader :score

  def initialize
    @score = 0
  end

  def roll(pins_down)
    @score += pins_down
  end
end
