require "docking_station"

describe DockingStation do
    it "should release a bike when requested" do 
     docking_station = DockingStation.new
     expect(docking_station).to respond_to(:release_bike)
    end
end