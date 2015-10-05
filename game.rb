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
      if first + second == 10 #spare
        score += 10 + @rolls[2*frame + 2]
      else
        score += first + second
      end
    end
    score
  end
end
