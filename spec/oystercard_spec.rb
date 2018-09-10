require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it 'has a @balance of 0' do
    expect(oystercard.balance).to eq(0)
  end

  describe '#topup' do
    it { is_expected.to respond_to(:topup).with(1).argument }

    it '#topsup @balance with the amount' do
      expect { oystercard.topup(4) }.to change { oystercard.balance }.by 4
    end
  end
end
