# docking_station = DockingStation
class DockingStation
  attr_reader :docked_bikes 

  def release_bike
    return docked_bikes unless docked_bikes.nil?
    raise "Sorry, no bikes left!"
  end

  def dock(bike)
    return raise "Sorry, no space left!" if docked_bikes
    @docked_bikes = bike
  end

end
