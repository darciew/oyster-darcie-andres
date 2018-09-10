class Oystercard
  MAXIMUM_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @limit = MAXIMUM_LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

  def topup(amount)
    raise "Maximum value of £#{@limit} reached" if @balance + amount > @limit
    @balance += amount
  end
end
