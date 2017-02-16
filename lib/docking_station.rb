# docking_station = DockingStation
class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    fail "Sorry, no bikes left!" unless !docked_bikes.empty?
    docked_bikes.shift
    #return docked_bikes unless docked_bikes.empty?
    #raise "Sorry, no bikes left!"
  end

  def dock(bike)
    fail "Sorry, no space left!" unless docked_bikes.length < 20
    #return raise "Sorry, no space left!" if docked_bikes
    @docked_bikes << bike
    docked_bikes.last
  end

end
