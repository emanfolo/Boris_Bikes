require "van"

describe Van do 
  let (:london_bridge) {double("london_bridge", :bikes => ["2","3"])}
  let (:empty_station) {double("empty_station", :bikes => [])}
  
  it "Should be respond to collect bikes with an argument of docking station" do 
    expect(subject).to respond_to(:collect_bikes).with(1).argument

  end
  it "Should be able to collect an array of bikes from the docking station" do 
    expect(subject.collect_bikes(london_bridge)).to be_a Array
  end

  it "Should raise an error when collect bikes is called on an empty array" do 
    expect{subject.collect_bikes(empty_station)}. to raise_error("There are no bikes")
  end



=begin
  it "Should be able to read the instance variable of bikes from each docking station" do 
    excpect(subject.collect_bikes(london_bridge)).to 
  end 
=end
end