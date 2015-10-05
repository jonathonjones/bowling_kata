require './game'

describe Game do
  def roll_many(n, pins)
    n.times { subject.roll(pins) }
  end

  it 'should score 0 for all gutterball game' do
    roll_many(20, 0)
    expect(subject.score).to eq 0
  end

  it 'should score 20 when one pin knocked down each time' do
    roll_many(20, 1)
    expect(subject.score).to eq 20
  end
end
