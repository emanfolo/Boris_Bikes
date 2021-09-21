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
    # it "bike should be working?" do 
    #     docking_station = DockingStation.new
    #     expect(docking_station.release_bike()).(:release_bike)
    #    end
end