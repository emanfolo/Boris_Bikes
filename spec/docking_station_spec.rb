require "docking_station"

describe DockingStation do
    it "it should respond to release a bike" do 
     docking_station = DockingStation.new
     expect(docking_station).to respond_to(:release_bike)
    end
    it "it should get a bike" do 
        bike = Bike.new
        docking_station = DockingStation.new
        expect(docking_station.release_bike).to be_a Bike 
        expect(bike.working?).to eq(true)
    end
    it "it should add a bike to counter for our docking station" do
        #Arrange
        bike = Bike.new
        docking_station = DockingStation.new
        #Act
        docking_station.add_counter
        expect(docking_station.counter).to eq(1)
    end
    it "it should create an instance of the Bike class" do 
        bike = Bike.new
        docking_station = DockingStation.new
        expect(docking_station.dock).to be_a Bike
    end
end