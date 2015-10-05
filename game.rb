# Represent a game of bowling
class Game
  def initialize
    @rolls = []
    @current_roll = 0
  end

  def roll(pins_down)
    @rolls[@current_roll] = pins_down
    @current_roll += 1
  end

  def score
    score = 0
    10.times do |frame|
      first = @rolls[2*frame]
      second = @rolls[2*frame + 1]
      score += first + second
    end
    score
  end
end
