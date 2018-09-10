require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  describe 'when instantiated' do
    it 'has a @balance of 0' do
      expect(oystercard.balance).to eq(0)
    end

    it 'has a default maximum limit of 90' do
      expect(Oystercard::MAXIMUM_LIMIT).to eq(90)
    end
  end
  describe '#topup' do
    it '#topsup @balance with the amount' do
      expect { oystercard.topup(4) }.to change { oystercard.balance }.by 4
    end

    it 'raises error if @balances exceeds maximum limit' do
      oystercard.topup(Oystercard::MAXIMUM_LIMIT)
      error = "Maximum value of £90 reached"
      expect { oystercard.topup(1) }.to raise_error error
    end
  end
end
