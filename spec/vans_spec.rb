require 'vans'

describe Vans do
  it "responds to load method with list of bikes as argument " do
    expect(subject).to respond_to(:load).with(1).argument
  end

  it "responds to unload method" do
    expect(subject).to respond_to(:unload)
  end

end
