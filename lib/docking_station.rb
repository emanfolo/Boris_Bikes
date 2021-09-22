require "bike"

class DockingStation
    attr_reader :bikes  

    def initialize
      @bikes = []
    end

    def release_bike
      Bike.new
      #@counter -= 1
    end 

    def dock 
      docked_bike = Bike.new
      @bikes << docked_bike
      docked_bike
    end 
end
