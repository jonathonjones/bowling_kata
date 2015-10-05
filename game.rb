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
      frame_index = frame * 2
      first = @rolls[frame_index]
      second = @rolls[frame_index + 1]
      if spare?(frame_index)
        score += 10 + @rolls[frame_index + 2]
      else
        score += first + second
      end
    end
    score
  end

  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end
end
