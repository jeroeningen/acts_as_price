require "#{File.dirname(__FILE__)}/spec_helper"

describe Car do
  before(:each) do
    @column_name = :price
    @acts_as_price_model = stub_model(Car, :brand => "Ford", :cartype => "Focus", :price => "23995.99")
  end

  context "given an empty car" do
    it "should return an invalid car" do
      car = Car.new
      should validate_presence_of :brand
      should validate_presence_of :cartype
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
  
  context "return the fueltype price" do
    it "should return the price in cents" do
      columns_in_cents.each do |column|
        @acts_as_price_model.send(column).should == 2399599
      end
    end
    it "should return the price" do
      columns_in_doubles.each do |column|
        @acts_as_price_model.send(column).should == "23995.99"
      end
    end
  end
  
  context "set the price per liter" do
    it "should set the price per liter in cents and return it correctly" do
      test_setter_in_cents "2209998"
    end
    it "should set the price per liter and return it correctly" do
      test_setter_in_doubles "25499.97"
    end
  end
  
  context "given a float as price per liter" do
    it "should convert it to the right price in cents" do
      test_setter_in_doubles "25500.5"
      test_setter_in_doubles "21599.05"
    end
  end
  
  context "given the price is zero" do
    it "should return an empty price per liter" do
      test_setter_in_cents ""
      test_setter_in_doubles ""
    end
  end
end