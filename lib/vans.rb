class Vans
  attr_reader :goods

  def load(broken_bikes)
    self.goods = broken_bikes
  end

  def unload
    self.goods
  end

  private
  attr_writer :goods
end
