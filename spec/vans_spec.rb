require 'vans'

describe Vans do
  before(:each) do
    @docking_station = DockingStation.new
    @van = Vans.new
  end
  it "responds to load method with list of bikes as argument " do
    expect(@van).to respond_to(:load).with(1).argument
  end

  it "responds to unload method" do
    expect(@van).to respond_to(:unload)
  end

  it "loads broken bikes from docking station" do
    broken_bike = Bike.new.report_broken
    working_bike = Bike.new
    @docking_station.dock(broken_bike)
    @docking_station.dock(working_bike)
    expect(@van.load(@docking_station.broken_bikes)).to eq Array(broken_bike)
  end

  it "can unload the stored bikes" do
    broken_bike = Bike.new.report_broken
    working_bike = Bike.new
    @docking_station.dock(broken_bike)
    @docking_station.dock(working_bike)
    @van.load(@docking_station.broken_bikes)
    expect(@van.unload).to eq Array(broken_bike)
  end

end
