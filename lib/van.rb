class Van
  attr_accessor :collected_bikes

  def initialize
    @collected_bikes = []
  end

  def collect_broken_bikes(docking_station)
    raise "There are no bikes" unless (!docking_station.bikes.empty?)
    until docking_station.bikes[0].working? do
        @collected_bikes << docking_station.bikes.shift
    end
    @collected_bikes
  end

  def drop_broken_bikes(garage)
    (garage.inventory << @collected_bikes).flatten!
    @collected_bikes = []
  end

  def collect_fixed_bikes(garage)
=begin
    raise "There are no bikes" unless (!garage.inventory.empty?)
    until !garage.inventory[0].working? do
        @collected_bikes << garage.inventory.shift
    end
=end
#Currently we are collecting all the bikes from the garage
#Next we can iterate through the bikes to ensure only fixed ones are collected
    @collected_bikes << garage.inventory.shift
    @collected_bikes
  end
end 