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

  it 'returns a bike object, if docking station has one'do
    # bike1 = Bike.new
    docking_station.dock(@bike)
    expect(docking_station.release_bike).to eq @bike

  end

  it "return an error message if dock is nil" do
    # docking_station.dock(nil) # we dont't need this as its nil to begin with
    expect {docking_station.release_bike}.to raise_error("Sorry, no bikes left!") #if docking_station.docked_bikes == nil
  end

  it {is_expected.to respond_to :dock} # should have a dock method

  it "check if docking station is receiving a bike when dock is called" do
    # bike = Bike.new
    expect(docking_station.dock(@bike)).to eq @bike
    allow(docking_station).to receive(:dock).with(an_instance_of(Bike)) {raise "station not receiving a Bike object"}
  end

  it "return an error message if dock is full" do
    # bike = Bike.new
    docking_station.dock(@bike)
    expect {docking_station.dock(@bike)}.to raise_error("Sorry, no space left!") #if docking_station.docked_bikes has a one Bike type
  end

  it {is_expected.to respond_to :docked_bikes}
  it "docking station should return a bike when docked_bikes is called" do
    # bike = Bike.new
    docking_station.dock(@bike)
    expect(docking_station.docked_bikes).to eq @bike
  end

end
