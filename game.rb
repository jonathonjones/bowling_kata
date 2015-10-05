# Represent a game of bowling
class Game
  def initialize
    @frames = []
    @current_roll = 0
    @current_frame = []
  end

  def roll(pins_down)
    @frames << [10] and return if pins_down == 10
    @current_frame << pins_down
    if @current_frame.size == 2
      @frames << @current_frame
      @current_frame = []
    end
  end

  def score
    score = 0
    10.times do |frame_index|
      if @frames[frame_index] == [10] #strike
        score += 10 + @frames[frame_index + 1][0] + @frames[frame_index + 1][1]
      elsif spare?(frame_index)
        score += 10 + @frames[frame_index + 1][0]
      else
        first = @frames[frame_index][0]
        second = @frames[frame_index][1]
        score += first + second
      end
    end
    score
  end

  def spare?(frame_index)
    @frames[frame_index][0] + @frames[frame_index][1] == 10
  end
end
