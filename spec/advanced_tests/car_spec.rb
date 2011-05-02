require File.expand_path("../../spec_helper", __FILE__)

describe Car do
  before(:each) do
    @column_name = :price
    @acts_as_price_model = stub_model(Car, :brand => "Ford", :cartype => "Stationwagon", :model => "Focus", :price => "23995,99")
  end

  context "given an empty car" do
    it "should return an invalid car" do
      car = Car.new
      should validate_presence_of :brand
      should validate_presence_of :cartype
      should validate_presence_of :model
      car.valid?.should be_false
      car.save.should be_false
    end
  end
  
  context "given an valid car" do
    it "should succesfully save" do
      car = Car.new @acts_as_price_model.attributes
      car.valid?.should be_true
      car.save.should be_true
    end
  end
  
  context "return the price" do
    it "should return the price in cents" do
      columns_in_cents.each do |column|
        @acts_as_price_model.send(column).should == 2399599
      end
    end
    it "should return the price seperated by a comma" do
      columns_in_doubles.each do |column|
        @acts_as_price_model.send(column).should == "EUR. 23995,99"
      end
    end
  end
  
  context "set the price for hundred different prices to test if you got no floating point problems" do
    2200000.upto(2200099) do |i|
      it "should set the price in cents and return it correctly (seperated by comma)" do
        test_setter_in_cents i.to_s, ","
      end
      it "should set the price and return it correctly (seperated by comma)" do
        test_setter_in_doubles sprintf("%.2f", i.to_f / 100).gsub(".", ","), ","
      end
    end
  end
  
  context "given a float as price" do
    it "should convert it to the right price in cents" do
      test_setter_in_doubles "EUR. 25500,5", ","
      test_setter_in_doubles "EUR. 21599,05", ","
      test_setter_in_doubles "EUR. 21599,055", ","
      test_setter_in_doubles "EUR. 21599,054", ","
    end
  end
  
  context "given the price is zero" do
    it "should return an empty price per liter" do
      test_setter_in_cents "", ","
      test_setter_in_doubles "", ","
    end
  end
end