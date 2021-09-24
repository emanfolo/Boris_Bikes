class Van
  attr_accessor :collected_bikes

  def initialize
    @collected_bikes = []
  end

  def collect_bikes(docking_station)
    raise "There are no bikes" unless (!docking_station.bikes.empty?)
    until docking_station.bikes[0].working? do
        @collected_bikes << docking_station.bikes.shift
    end
    @collected_bikes
  end
end 