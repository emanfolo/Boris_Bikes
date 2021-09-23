require "docking_station"

describe DockingStation do
    it "it should respond to release a bike" do 
     docking_station = DockingStation.new
     expect(docking_station).to respond_to(:release_bike)
    end

    it "the 'bike' you docked should work" do 
        bike = double("bike", :is_working => true)
        allow(bike).to receive(:working?).and_return(true)
        expect(bike).to receive(:is_working=).with(true)

        docking_station = DockingStation.new
        docking_station.dock(bike)
        #expect(docking_station.release_bike).to be_a Bike 
        expect(bike.working?).to eq(true)
    end
    it "it should add a bike to counter for our docking station" do
        #Arrange
        bike = Bike.new
        docking_station = DockingStation.new
        #Act
        docking_station.dock(bike)
        #Expect
        expect(docking_station.bikes.length).to eq(1)
    end
=begin
    it "it should create an instance of the Bike class" do 
        bike = Bike.new
        docking_station = DockingStation.new
        expect(docking_station.dock(bike)).to be_a Bike
    end
=end 
    it "it should raise an error when we request an empty docking station to release a bike" do 
        bike = Bike.new
        docking_station = DockingStation.new
        expect{ docking_station.release_bike }.to raise_error
    end

    it "it should raise an error when we request to dock a bike at a full docking station" do 
        bike = Bike.new
        docking_station = DockingStation.new
        docking_station.capacity.times { docking_station.dock(bike) }
        expect{ docking_station.dock(bike) }.to raise_error
    end

    it "it should allow the user to set the capacity instance variable when DockingStation.new is called" do
        docking_station = DockingStation.new(5)
        expect(docking_station.capacity).to eq(5)
    end 

    it "it should have a default capacity of 20 when DockingStation.new is called without an argument" do
        docking_station = DockingStation.new
        expect(docking_station.capacity).to eq(20)
    end 

    it "bikes should be working by default when docked, unless reported as broken" do
        docking_station = DockingStation.new 
        bike = Bike.new
        docking_station.dock(bike)
        expect(bike.working?).to eq(true)
    end 

    it "user should be able to report a bike as broken when they return it" do 
        docking_station = DockingStation.new
        bike = Bike.new
        docking_station.dock(bike, false)
        expect(bike.working?).to eq(false)
    end

    it "docking stations should not release broken bikes" do 
        docking_station = DockingStation.new
        bike = Bike.new
        docking_station.dock(bike, false)
        expect{docking_station.release_bike}.to raise_error("This bike is broken")
    end 

    it "docking stations should accept broken bikes" do 
        docking_station = DockingStation.new
        bike = Bike.new(false)       
        expect(docking_station).to respond_to(:dock)
    end
end