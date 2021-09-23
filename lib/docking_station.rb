require "bike"

class DockingStation
    attr_reader :bikes, :capacity
    DEFAULT_CAPACITY = 20

    def initialize(capacity= DEFAULT_CAPACITY)
      @capacity = capacity
      @bikes = []
    end

    def release_bike
      raise "There are no bikes" unless self.empty? == false
      raise "This bike is broken" unless @bikes.last.is_working == true
      @bikes.pop
    end 

    def dock(docked_bike, is_working= true)
      raise "This docking station is full" unless self.full? == false 
      docked_bike.working? ? @bikes << docked_bike : @bikes.unshift(docked_bike)
      docked_bike.is_working = is_working
    end

    private 

    def full? 
      @bikes.length >= @capacity ? true : false 
    end 

    def empty?
      @bikes.length == 0 ? true : false 
    end 
end
