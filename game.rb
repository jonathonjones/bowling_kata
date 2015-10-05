# Represent a game of bowling
class Game
  def initialize
    @frames = []
    @current_roll = 0
    @current_frame = Frame.new
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
        score += sum_of_balls_in_frame(frame_index)
      end
    end
    score
  end

  def spare?(frame_index)
    sum_of_balls_in_frame(frame_index) == 10
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

  def sum_of_balls_in_frame(frame_index)
    first = @frames[frame_index][0]
    second = @frames[frame_index][1]
    first + second
  end

  class Frame < Array

  end
end
