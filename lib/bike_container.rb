module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    raise "#{self.class} full" if full?
    bikes << bike
  end

  def empty?
    bikes.empty?
  end

  def remove_bike
    raise "#{self.class} empty" if empty?
    bikes.pop
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

end
