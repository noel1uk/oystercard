require_relative "station"

class Oystercard

  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  DEFAULT_LIMIT = 90
  attr_reader :balance, :entry_station, :exit_station, :history

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @history = []
    #@current_journey = nil
    reset_station
  end

  def top_up(amount)
    raise "Maximum balance of #{DEFAULT_LIMIT} exceeded" if limit_reached?(amount)
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise "Minimum balance not met" if @balance < MINIMUM_BALANCE
    @entry_station = station
    #@current_journey = Journey.new#creates a new journey object
  end

  def touch_out(station)
    raise "Not yet in journey" unless in_journey?
    deduct(MINIMUM_BALANCE)
    @exit_station = station
    # save_journey # send the current journey from joirney object to @history in oyster card
    reset_station
  end

  private

  def reset_station
    @entry_station = nil
    @exit_station = nil

  end

  def limit_reached?(amount)
    (@balance + amount) > DEFAULT_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

  # def save_journey
  #   @journey_history << {:entry_station => @entry_station, :exit_station => @exit_station}
  # end
end
