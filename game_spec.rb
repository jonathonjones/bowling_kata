require './game'

describe Game do
  it { should be_a Game }
  it 'should be able to roll 20 times' do
    expect { 20.times { subject.roll(0) } }.to_not raise_error
  end

  it 'should score 0 for all gutterball game' do
    20.times { subject.roll(0) }
    expect(subject.score).to eq 0
  end

  it 'should score 20 when one pin knocked down each time' do
    20.times { subject.roll(1) }
    expect(subject.score).to eq 20
  end
end
