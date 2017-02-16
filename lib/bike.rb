class Bike
 # why is it not working when made private??

  def initialize
    @is_working = true
  end

  def working?
    is_working
  end

  def report_broken
    self.is_working = false
    self
  end

  private
  attr_accessor :is_working
end
