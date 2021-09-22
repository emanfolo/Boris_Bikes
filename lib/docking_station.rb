require "bike"

class DockingStation
    attr_reader :counter  

    def initialize
      @counter = 0
    end

    def release_bike
      Bike.new
      #@counter -= 1
    end 

    def dock 
      Bike.new
    end 

    def add_counter
      @counter += 1 
    end 
end
