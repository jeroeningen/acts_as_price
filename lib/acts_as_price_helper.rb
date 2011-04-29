module ActsAsPriceHelper
  # Test the acts_as_price plugin for the specified column_name and model
  #   
  # Note the you can also specify the model in a before block in your tests
  def test_acts_as_price_methods column_name, acts_as_price_model = nil
    @acts_as_price_model = acts_as_price_model if acts_as_price_model
    
    @column_name = column_name
    columns_in_cents.each do |column|
      @acts_as_price_model.send(column).should == @acts_as_price_model.price_in_cents
    end
    columns_in_doubles.each do |column|
      @acts_as_price_model.send(column).should == @acts_as_price_model.price
    end
    
    #normal test for setter
    test_setter_in_cents "144"
    test_setter_in_doubles "1.41"
    
    #test for special cases
    #test if 1.5 is returned as 1.50
    test_setter_in_doubles "1.5"
    
    #test if float returns 2.05 correctly 
    #float can return 2.05 as 2.04 in some cases
    test_setter_in_doubles "2.05"
    
    #test an empty_setter
    test_setter_in_cents ""
    test_setter_in_doubles ""
  end  
  
  # test if the setter sets the price correctly if price is given in integers
  def test_setter_in_cents cents, seperator
    columns_in_cents.each do |setter|
      @acts_as_price_model.send("#{setter}=", cents)
      columns_in_cents.each do |getter|
        @acts_as_price_model.send(getter).should == cents.to_i
      end
      columns_in_doubles.each do |getter|
        if cents == ""
          @acts_as_price_model.send(getter).should == ""
        else
          @acts_as_price_model.send(getter).should == sprintf("%.2f", (cents.to_f / 100).to_s).gsub(".", seperator)
        end
      end
    end
  end
  
  # test if the setter sets the price correctly if price is given in doubles
  def test_setter_in_doubles double, seperator
    columns_in_doubles.each do |setter|
      @acts_as_price_model.send("#{setter}=", double)
      columns_in_cents.each do |getter|
        @acts_as_price_model.send(getter).should == (double.gsub(",", ".").to_f * 100).to_s.to_i
      end
      columns_in_doubles.each do |getter|
        if double == ""
          @acts_as_price_model.send(getter).should == ""
        else
          @acts_as_price_model.send(getter).should == sprintf("%.2f", double.gsub(",", ".")).gsub(".", seperator)
        end
      end
    end
  end
  
  def columns_in_cents 
    [:price_in_cents, "#{@column_name}_in_cents"]
  end
    
  def columns_in_doubles
    [:price, @column_name]
  end

# function not used    
#  def columns
#    columns_in_doubles + columns_in_cents
#  end
end