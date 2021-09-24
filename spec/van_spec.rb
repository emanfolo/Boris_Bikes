require "van"
require "bike"

describe Van do 
  let (:bike) {double("bike", :is_working => true)}
  let (:broken_bike) {double("broken_bike", :is_working => false)}

  let (:london_bridge) {double("london_bridge", :bikes => [bike, bike])}
  let (:empty_station) {double("empty_station", :bikes => [])}
  let (:liverpool_street) {double("liverpool_street", :bikes => [broken_bike, broken_bike, bike, bike])}
  
  before do 
    allow(bike).to receive(:working?).and_return(true)
    allow(broken_bike).to receive(:working?).and_return(false)
  end

  it "Should be respond to collect bikes with an argument of docking station" do 
    expect(subject).to respond_to(:collect_bikes).with(1).argument

  end
  it "Should be able to collect an array of bikes from the docking station" do 
    expect(subject.collect_bikes(liverpool_street)).to be_a Array
  end

  it "Should raise an error when collect bikes is called on an empty array" do 
    expect{subject.collect_bikes(empty_station)}. to raise_error("There are no bikes")
  end

  it "Should only take broken bikes from the docking station" do
    subject.collect_bikes(liverpool_street)
    expect(subject.collected_bikes.all? {|bikes| !bikes.working?}).to eq true
  end



=begin
  it "Should be able to read the instance variable of bikes from each docking station" do 
    excpect(subject.collect_bikes(london_bridge)).to 
  end 
=end
end