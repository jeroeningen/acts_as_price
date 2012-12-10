require File.expand_path("../../spec_helper", __FILE__)

describe Fueltype do
  before(:each) do
    @column_name = :price_per_liter
    @acts_as_price_model = stub_model(Fueltype, :name => "Euro 95", :price_per_liter => "1.55")
    @seperator = "."
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
  
  context "set the price per liter for hundred different prices to test if you got no floating point problems" do
    1.upto(100).each do |i|
      it "should set the price per liter in cents and return it correctly" do
        test_setter_in_cents i.to_s, @seperator
      end
      it "should set the price per liter and return it correctly" do
        test_setter_in_doubles sprintf("%.2f", i.to_f / 100), @seperator
      end
    end
  end
  
  context "given a float as price per liter" do
    it "should convert it to the right price in cents" do
      test_setter_in_doubles "1.5", @seperator
      test_setter_in_doubles "2.05", @seperator
      test_setter_in_doubles "2.055", @seperator
      test_setter_in_doubles "2.054", @seperator
    end
  end
  
  context "given the price is zero" do
    it "should return an empty price per liter" do
      test_setter_in_cents "", @seperator
      test_setter_in_doubles "", @seperator
    end
  end
end