require './game'

describe Game do
  def roll_many(n, pins)
    n.times { subject.roll(pins) }
  end

  def roll_spare
    subject.roll(5)
    subject.roll(5)
  end

  it 'should score 0 for all gutterball game' do
    roll_many(20, 0)
    expect(subject.score).to eq 0
  end

  it 'should score 20 when one pin knocked down each time' do
    roll_many(20, 1)
    expect(subject.score).to eq 20
  end

  it 'should score a spare correctly' do
    roll_spare
    subject.roll(3)
    roll_many(17, 0)
    expect(subject.score).to eq 16
  end

  it 'should score a strike correctly' do
    subject.roll(10) #strike
    subject.roll(3)
    subject.roll(4)
    roll_many(16,0)
    expect(subject.score).to eq 24
  end
end
