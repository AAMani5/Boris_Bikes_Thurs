require 'docking_station'

describe DockingStation do

  before(:all) do
    @bike = Bike.new
  end

  alias_method :docking_station, :subject

  ### Bike related tests - why do we have it in docking_station_spec?
  it 'bike responds to working and returns true' do
    # bike = Bike.new # dont only once in the begining
    expect(@bike).to be_working
  end

  ### DockingStation related tests
  it {is_expected.to respond_to :release_bike} # should have a release_bike method

  #it { expect(docking_station.release_bike).to be_an_instance_of Bike} # release_bike should return a Bike type

  it 'returns a bike, if docking station has one'do
    # bike1 = Bike.new
    docking_station.dock(@bike)
    expect(docking_station.release_bike).to eq @bike
  end

  it "raises an error if it's empty" do
    # docking_station.dock(nil) # we dont't need this as its nil to begin with
    expect {docking_station.release_bike}.to raise_error("Sorry, no bikes left!") #if docking_station.docked_bikes == nil
  end

  it {is_expected.to respond_to :dock} # should have a dock method

  it "receives a bike when docked" do
    # bike = Bike.new
    expect(docking_station.dock(@bike)).to eq @bike
    allow(docking_station).to receive(:dock).with(an_instance_of(Bike)) {raise "station not receiving a Bike object"}
  end

  it "returns an error message if it's full" do
    # bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(@bike)}
    expect {docking_station.dock(@bike)}.to raise_error("Sorry, no space left!") #if docking_station.docked_bikes has a one Bike type
  end

  it {is_expected.to respond_to :docked_bikes}
  it "displays bike that is already docked" do
    # bike = Bike.new
    docking_station.dock(@bike)
    expect(docking_station.docked_bikes).to be_an_instance_of Array
    expect(docking_station.docked_bikes.last).to eq @bike
  end

  it "makes a Docking Station which can hold a number of bikes" do
    expect(subject.docked_bikes).to be_an_instance_of Array
  end
end
