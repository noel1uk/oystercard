class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station,exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def in_journey?
    !!@entry_station
  end

  def save
    {:entry_station => entry_station, :exit_station => exit_station}
  end


  def touch_out(station)
    raise "Not yet in journey" unless in_journey?
    deduct(MINIMUM_BALANCE)
    @exit_station = station
    history << journey.save_journey
    reset_station
  end


end
