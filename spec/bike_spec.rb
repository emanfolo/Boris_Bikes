require "bike"

describe Bike do
    it "should release a bike when requested" do 
      bike = Bike.new
      expect(bike).to respond_to(:working?)
    end
end

