require "van"
require "bike"

describe Van do 
  let (:bike) {double("bike", :is_working => true)}
  let (:broken_bike) {double("broken_bike", :is_working => false)}

  let (:london_bridge) {double("london_bridge", :bikes => [bike, bike])}
  let (:empty_station) {double("empty_station", :bikes => [])}
  let (:liverpool_street) {double("liverpool_street", :bikes => [broken_bike, broken_bike, bike, bike])}
  
  let (:garage) {double("garage", :inventory => [])}
  let (:garage2) {double("garage2", :inventory => [bike, bike])}

  before do 
    allow(bike).to receive(:working?).and_return(true)
    allow(broken_bike).to receive(:working?).and_return(false)
  end

  it "Should be respond to collect bikes with an argument of docking station" do 
    expect(subject).to respond_to(:collect_broken_bikes).with(1).argument

  end
  it "Should be able to collect an array of bikes from the docking station" do 
    expect(subject.collect_broken_bikes(liverpool_street)).to be_a Array
  end

  it "Should raise an error when collect bikes is called on an empty array" do 
    expect{subject.collect_broken_bikes(empty_station)}. to raise_error("There are no bikes")
  end

  it "Should only take broken bikes from the docking station" do
    subject.collect_broken_bikes(liverpool_street)
    expect(subject.collected_bikes.all? {|bikes| !bikes.working?}).to eq true
  end

  it "Should be able to respond to the drop off" do 
    expect(subject).to respond_to(:drop_broken_bikes).with(1).argument
  end 

  it "Should empty the bikes into the garage" do
    bike_array = subject.collect_broken_bikes(liverpool_street)
    subject.drop_broken_bikes(garage)
    expect(garage.inventory).to eq(bike_array)
    expect(subject.collected_bikes).to eq([])
  end 

  it "Should collect fixed bikes from the garage" do 
    bike_array = garage2.inventory
    expect(subject.collect_fixed_bikes(garage2)).to eq(bike_array)
  end
end