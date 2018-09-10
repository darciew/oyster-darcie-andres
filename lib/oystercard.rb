class Oystercard
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :balance, :origin

  def initialize
    @balance = 0
    @limit = MAXIMUM_LIMIT
    @min_limit = MINIMUM_LIMIT
    @journey = 1
    @in_journey = false
  end

  def topup(amount)
    raise "Maximum value of £#{@limit} reached" if @balance + amount > @limit
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < @min_limit
    @origin = station
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(@journey)
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
