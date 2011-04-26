require "#{File.dirname(__FILE__)}/spec_helper"

describe Fueltype do
  before(:each) do
    @column_name = :price_per_liter
    @acts_as_price_model = stub_model(Fueltype, :name => "Euro 95", :price_per_liter => "1.55")
  end
  
  context "given an empty fueltype" do
    it "should give an invalid fueltype and not save it" do
      fueltype = Fueltype.new
      should validate_presence_of :name
      should validate_presence_of @column_name
      fueltype.valid?.should be_false
      fueltype.save.should be_false
    end
  end
  
  context "given an valid fueltype" do
    it "should be valid and saved" do
      fueltype = Fueltype.new @acts_as_price_model.attributes
      fueltype.valid?.should be_true
      fueltype.save.should be_true
    end
  end
  
  context "return the fueltype price" do
    it "should return the price in cents" do
      columns_in_cents.each do |column|
        @acts_as_price_model.send(column).should == 155
      end
    end
    it "should return the price" do
      columns_in_doubles.each do |column|
        @acts_as_price_model.send(column).should == "1.55"
      end
    end
  end
  
  context "set the price per liter for hundred different prices" do
    1.upto(100).each do |i|
      it "should set the price per liter in cents and return it correctly" do
        test_setter_in_cents i.to_s
      end
      it "should set the price per liter and return it correctly" do
        test_setter_in_doubles sprintf("%.2f", i.to_f / 100)
      end
    end
  end
  
  context "given a float as price per liter" do
    it "should convert it to the right price in cents" do
      test_setter_in_doubles "1.5"
      test_setter_in_doubles "2.05"
    end
  end
  
  context "given the price is zero" do
    it "should return an empty price per liter" do
      test_setter_in_cents ""
      test_setter_in_doubles ""
    end
  end
end