require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it 'has a @balance of 0' do
    expect(oystercard.balance).to eq(0)
  end
end
