require "bike"

class DockingStation
    attr_reader :bikes  

    def initialize
      @bikes = []
    end

    def release_bike
      raise ('Docking Station empty') unless @bikes.length > 0
      Bike.new if @bikes.length > 0
      #@counter -= 1
    end 

    def dock 
      docked_bike = Bike.new
      @bikes << docked_bike
      docked_bike
    end 
end
