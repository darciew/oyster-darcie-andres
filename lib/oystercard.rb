class Oystercard
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @limit = MAXIMUM_LIMIT
    @min_limit = MINIMUM_LIMIT
    @in_journey = false
  end

  def deduct(amount)
    @balance -= amount
  end

  def topup(amount)
    raise "Maximum value of £#{@limit} reached" if @balance + amount > @limit
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds" if @balance < @min_limit
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
