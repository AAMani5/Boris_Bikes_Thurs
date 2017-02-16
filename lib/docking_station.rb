# docking_station = DockingStation
class DockingStation
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
  end

  def release_bike
    fail "Sorry, no bikes left!" if empty?
    docked_bikes.shift
    #return docked_bikes unless docked_bikes.empty?
    #raise "Sorry, no bikes left!"
  end

  def dock(bike)
    fail "Sorry, no space left!" if full?
    #return raise "Sorry, no space left!" if docked_bikes
    @docked_bikes << bike
    docked_bikes.last
  end

  private

  def full?
    docked_bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    docked_bikes.empty?
  end
end
