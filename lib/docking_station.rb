require "bike"

class DockingStation
    attr_reader :bikes  
    DEFAULT_CAPACITY = 20
    
    # def capacity 
    #   DEFAULT_CAPACITY
    # end

    def initialize
      @bikes = []
    end

    def release_bike
      if self.empty? == true  
        raise "There are no bikes"
      else 
        Bike.new 
      end
      #raise ('Docking Station empty') unless @bikes.length > 0
      #Bike.new if @bikes.length > 0
      #@counter -= 1
    end 

    def dock 
      if self.full? == true
       raise "This docking station is full"
      else 
        docked_bike = Bike.new
        @bikes << docked_bike
      end
    end

    private 

    def full? 
      @bikes.length >= DEFAULT_CAPACITY ? true : false 
    end 

    def empty?
      @bikes.length == 0 ? true : false 
    end 
end
