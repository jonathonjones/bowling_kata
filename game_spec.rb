require './game'

describe Game do

  it { should be_a Game }
  it 'should be able to roll 20 times' do
    expect{ 20.times { subject.roll(0) } }.to_not raise_error
  end
end