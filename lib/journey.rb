class Journey

  attr_reader :history, :entry_station, :exit_station

  def initialize
    @history = []
  end

  def in_journey?
    !!@entry_station
  end

  



end
