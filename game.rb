# Represent a game of bowling
class Game
  def initialize
    @frames = []
    @current_roll = 0
    @current_frame = Frame.new
  end

  def roll(pins_down)
    @current_frame << pins_down
    if @current_frame.size == 2 || pins_down == 10
      @frames << @current_frame
      @current_frame = Frame.new
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
    @frames[frame_index].strike?
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
    @frames[frame_index].sum
  end

  class Frame < Array
    def strike?
      first == 10
    end

    def sum
      inject(&:+)
    end
  end
end
