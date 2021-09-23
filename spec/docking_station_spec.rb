require "docking_station"

describe DockingStation do
    let (:bike) {double("bike", :is_working => true)}
    let (:broken_bike) {double("broken_bike", :is_working => false)}
    

    it "it should respond to release a bike" do 
     subject = DockingStation.new
     expect(subject).to respond_to(:release_bike)
    end

    it "the 'bike' you docked should work" do 
        allow(bike).to receive(:working?).and_return(true)
        expect(bike).to receive(:is_working=).with(true)

        subject = DockingStation.new
        subject.dock(bike)
        #expect(subject.release_bike).to be_a Bike 
        expect(bike.working?).to eq(true)
    end
    it "it should add a bike to counter for our docking station" do
        allow(bike).to receive(:working?).and_return(true)
        expect(bike).to receive(:is_working=).with(true)
        #Arrange
        subject = DockingStation.new
        #Act
        subject.dock(bike)
        #Expect
        expect(subject.bikes.length).to eq(1)
    end
=begin
    it "it should create an instance of the Bike class" do 
        subject = DockingStation.new
        expect(subject.dock(bike)).to be_a Bike
    end
=end 
    it "it should raise an error when we request an empty docking station to release a bike" do 

        subject = DockingStation.new
        expect{ subject.release_bike }.to raise_error
    end

    it "it should raise an error when we request to dock a bike at a full docking station" do 
        allow(bike).to receive(:working?).and_return(true)
        expect(bike).to receive(:is_working=).with(true).at_least(:once)
        subject = DockingStation.new
        subject.capacity.times { subject.dock(bike) }
        expect{ subject.dock(bike) }.to raise_error
    end

    it "it should allow the user to set the capacity instance variable when DockingStation.new is called" do
        subject = DockingStation.new(5)
        expect(subject.capacity).to eq(5)
    end 

    it "it should have a default capacity of 20 when DockingStation.new is called without an argument" do
        subject = DockingStation.new
        expect(subject.capacity).to eq(20)
    end 

    it "bikes should be working by default when docked, unless reported as broken" do
        allow(bike).to receive(:working?).and_return(true)
        expect(bike).to receive(:is_working=).with(true)
        subject = DockingStation.new 
        subject.dock(bike)
        expect(bike.working?).to eq(true)
    end 

    it "user should be able to report a bike as broken when they return it" do 
        allow(broken_bike).to receive(:working?).and_return(false)
        expect(broken_bike).to receive(:is_working=).with(false)
        subject = DockingStation.new
        subject.dock(broken_bike, false)
        expect(broken_bike.working?).to eq(false)
    end

    it "docking stations should not release broken bikes" do 
        allow(broken_bike).to receive(:working?).and_return(false)
        expect(broken_bike).to receive(:is_working=).with(false)
        subject = DockingStation.new
        subject.dock(broken_bike, false)
        expect{subject.release_bike}.to raise_error("This bike is broken")
    end 

    it "docking stations should accept broken bikes" do 
        subject = DockingStation.new(false)       
        expect(subject).to respond_to(:dock)
    end
end