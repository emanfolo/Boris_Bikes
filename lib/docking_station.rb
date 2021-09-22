require "bike"

class DockingStation
    attr_reader :bikes  

    def initialize
      @bikes = []
    end

    def release_bike
      if @bikes.length == 0 
        raise "There are no bikes"
      else 
        Bike.new 
      end
      #raise ('Docking Station empty') unless @bikes.length > 0
      #Bike.new if @bikes.length > 0
      #@counter -= 1
    end 

    def dock 
      if @bikes.length >= 20
        raise "This docking station is full"
      else 
        docked_bike = Bike.new
        @bikes << docked_bike
        docked_bike
      end
    end 
end
