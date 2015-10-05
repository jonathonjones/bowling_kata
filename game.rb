# Represent a game of bowling
class Game
  def initialize
    @frames = []
    @current_frame = Frame.new
  end

  def roll(pins_down)
    @current_frame << pins_down
    return unless  @current_frame.size == 2 || pins_down == 10
    @frames << @current_frame
    @current_frame = Frame.new
  end

  def score
    score = 0
    10.times do |frame_index|
      score += score_for_frame(frame_index)
    end
    score
  end

  def score_for_frame(frame_index)
    frame = frame_from_index(frame_index)
    if frame.strike?
      10 + strike_bonus(frame_index)
    elsif frame.spare?
      10 + spare_bonus(frame_index)
    else
      sum_of_balls_in_frame(frame_index)
    end
  end

  def frame_from_index(frame_index)
    @frames[frame_index]
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

  # A frame has two rolls. There are ten normal frames (plus bonus).
  class Frame < Array
    def strike?
      first == 10
    end

    def sum
      inject(&:+)
    end

    def spare?
      sum == 10
    end
  end
end
