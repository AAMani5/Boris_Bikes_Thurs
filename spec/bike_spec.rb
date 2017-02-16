require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?} # check if bike as a method called working?
  it {is_expected.to be_working} # using predicate matchers to check if working? returns true

  it {is_expected.to respond_to :report_broken}

  it "stops working when reported broken" do
     subject.report_broken
     is_expected.to_not be_working
  end

  #it 'works' do
    # bike = Bike.new
    # expect(bike).to be_working
  #end
end
