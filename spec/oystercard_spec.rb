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

    it 'has a default minimum limit of 1' do
      expect(Oystercard::MINIMUM_LIMIT).to eq(1)
    end
  end

  describe '#deduct' do
    it 'deducts amount from @balance' do
      oystercard.topup(20)
      expect { oystercard.deduct(7) }.to change { oystercard.balance }.by -7
    end
  end

  describe '#topup' do

    context 'when amount below max limit' do
      it '#topsup @balance with the amount' do
        expect { oystercard.topup(4) }.to change { oystercard.balance }.by 4
      end
    end

    context 'when amount above max limit' do
      it 'raises error' do
        oystercard.topup(Oystercard::MAXIMUM_LIMIT)
        error = "Maximum value of £90 reached"
        expect { oystercard.topup(1) }.to raise_error error
      end
    end
  end

  describe '#in_journey?' do
    it 'returns false on instantiation' do
      expect(oystercard.in_journey?).to eq(false)
    end
  end

  describe '#touch_in' do
    context 'when balance above min limit' do
      it '@in_journey assigned true' do
        oystercard.topup(10)
        oystercard.touch_in
        expect(oystercard.in_journey?).to eq(true)
      end
    end

    context 'when balance below min limit' do
      it 'raises error if balance is < £1' do
        expect { oystercard.touch_in }.to raise_error('Insufficient funds')
      end
    end
  end

  describe '#touch_out' do
    it '@in_journey assigned false if user touches out' do
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq(false)
    end
  end
end
