# Represent a game of bowling
class Game
  def initialize
    @score = 0
    @rolls = []
    @current_roll = 0
  end

  def roll(pins_down)
    @score += pins_down
    @rolls[@current_roll] = pins_down
    @current_roll += 1
  end

  def score
    score = 0
    @rolls.each do |roll|
      score += roll
    end
    score
  end
end
