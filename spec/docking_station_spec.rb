require 'docking_station'

describe DockingStation do

  before(:each) do
    @bike = double(:bike)
  end

  alias_method :docking_station, :subject

  ### Bike related tests - why do we have it in docking_station_spec?
  it 'bike responds to working and returns true' do
    # bike = Bike.new # dont only once in the begining
    #bike = double(:bike)
    allow(@bike).to receive(:working?){true} # a method stud (query)
    expect(@bike).to be_working
  end

  ### DockingStation related tests
  it {is_expected.to respond_to :release_bike} # should have a release_bike method

  #it { expect(docking_station.release_bike).to be_an_instance_of Bike} # release_bike should return a Bike type

  it 'returns a bike, if docking station has one'do
    # bike1 = Bike.new
    allow(@bike).to receive(:working?){true}
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

  it "makes a Docking Station with the default number of bike spaces" do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "makes a Docking Station with a larger number of bike spaces than the default" do
    expect(DockingStation.new(DockingStation::DEFAULT_CAPACITY+1).capacity).to be > DockingStation::DEFAULT_CAPACITY
  end

  it "releases only working bikes" do
    allow(@bike).to receive(:working?){true}
    docking_station.dock(@bike)
    expect(docking_station.release_bike).to be_working
  end

  it "should not release broken bikes" do
    allow(@bike).to receive(:report_broken){@bike}
    allow(@bike).to receive(:working?){false}
    docking_station.dock(@bike.report_broken)
    expect{docking_station.release_bike}.to raise_error("Sorry, no working bikes left!")
  end

  it "should only return working bikes", :focus => true do
    allow(@bike).to receive(:report_broken){@bike}
    allow(@bike).to receive(:working?){false}
    broken_bike = @bike.report_broken
    working_bike = double(:working_bike)
    allow(working_bike).to receive(:working?){true}
    docking_station = DockingStation.new
    docking_station.dock(broken_bike)
    docking_station.dock(working_bike)
    expect(docking_station.release_bike).to eq working_bike
    expect{docking_station.release_bike}.to raise_error("Sorry, no working bikes left!")
  end

end
