require "docking_station"

describe DockingStation do 
    it "should release a bike when requested" do 
        release = DockingStation.new
        expect(release.check("Release")).to(eq(true))
    end
end