class Bike
attr_accessor :status # why is it not working when made private??

  def initialize
    @status = true
  end

  def working?
    self.status
  end

  def report_broken(boolean = false)
    self.status = !boolean
  end

end
