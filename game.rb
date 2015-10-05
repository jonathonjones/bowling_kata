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
      if strike?(frame_index)
        score += 10 + strike_bonus(frame_index)
      elsif spare?(frame_index)
        score += 10 + spare_bonus(frame_index)
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

  def strike?(frame_index)
    @frames[frame_index][0] == 10
  end

  def strike_bonus(frame_index)
    first = @frames[frame_index + 1][0]
    second = first == 10 ? @frames[frame_index + 2][0] : @frames[frame_index + 1][1]
    first + second
  end

  def spare_bonus(frame_index)
    @frames[frame_index + 1][0]
  end
end
