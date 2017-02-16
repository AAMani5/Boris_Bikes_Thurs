# docking_station = DockingStation
class DockingStation
  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "Sorry, no bikes left!" if empty?
    fail "Sorry, no working bikes left!" if none_working?
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

  def none_working?
    docked_bikes.none?{|bike| bike.working?}
  end
end
