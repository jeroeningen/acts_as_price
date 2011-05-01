require File.expand_path("../../spec_helper", __FILE__)

#Car return the price as a comma seperated value
describe Car do
  context "adding a price as comma seperated value" do
    it "should return the price as comma-seperated value" do
      car = stub_model(Car, :price => "23000,59")
      car.price.should == "EUR. 23000,59"
    end
    it "should return the pricce in cents" do
      car = stub_model(Car, :price => "23000,59")
      car.price_in_cents.should == 2300059
    end
  end
  
  context "adding the price as a dot seperated value" do
    it "should return the price as a comma seperated value" do
      car = stub_model(Car, :price => "23000.59")
      car.price.should == "EUR. 23000,59"
      car = stub_model(Car, :price => "23000.5")
      car.price.should == "EUR. 23000,50"
    end
  end
  
  context "adding the price as an integer" do
    it "should return the price as a comma-seperated value" do
      car = stub_model(Car, :price => "23000")
      car.price.should == "EUR. 23000,00"
    end
  end
  
  context "using a currency" do
    it "should return a currency" do
      car = stub_model(Car)
      car.currency.should == "EUR"
    end
  end
end

#Fueltype returns the price as a dot seperated value
describe Fueltype do
  context "adding the price as an comma sewperated value" do
    it "should return the price as a dot seperated value" do
      fueltype = stub_model(Fueltype, :price_per_liter => "1,59")
      fueltype.price.should == "1.59"
      fueltype.price_per_liter.should == "1.59"
    end
    it "should return the price in cents" do
      fueltype = stub_model(Fueltype, :price_per_liter => "1,59")
      fueltype.price_per_liter_in_cents.should == 159
      fueltype.price_in_cents.should == 159
    end
  end
  
  context "adding the price as a dot seperated value" do
    it "should return the price as a dot seperated value" do
      fueltype = stub_model(Fueltype, :price_per_liter => "1.59")
      fueltype.price_per_liter.should == "1.59"
      fueltype.price.should == "1.59"
      fueltype = stub_model(Fueltype, :price_per_liter => "1,5")
      fueltype.price_per_liter.should == "1.50"
      fueltype.price.should == "1.50"
    end
  end
  
  context "adding the price as an integer" do
    it "should return the price as a dot seperated value" do
      fueltype = stub_model(Fueltype, :price_per_liter => "1")
      fueltype.price_per_liter.should == "1.00"
      fueltype.price.should == "1.00"
    end
  end

  context "adding a price that could give a floating point problem" do
    it "should return the right prices" do
      fueltype = stub_model(Fueltype, :price_per_liter => "2,05")
      fueltype.price.should == "2.05"
      fueltype.price_per_liter.should == "2.05"
      fueltype.price_in_cents.should == 205
      fueltype.price_per_liter_in_cents.should == 205
    end
  end
end