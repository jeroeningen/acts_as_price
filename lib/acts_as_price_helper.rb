module ActsAsPriceHelper
  # Test the acts_as_price plugin for the specified column_name and given seperator.
  # 
  # Valid options:
  # * model: Not just the model name, but a full object of the model
  # 
  # EXAMPLE:
  # * test_acts_as_price_methods :price, ",", :model => @fuel
  # Note the you can also specify the model in a before block in your tests
  def test_acts_as_price_methods column_name, seperator, options = {}
    @acts_as_price_model = options[:model] if options[:model]
    
    @column_name = column_name
    columns_in_cents.each do |column|
      @acts_as_price_model.send(column).should == @acts_as_price_model.price_in_cents
    end
    columns_in_doubles.each do |column|
      @acts_as_price_model.send(column).should == @acts_as_price_model.price
    end
    
    #normal test for setter
    test_setter_in_cents "144", seperator
    if @acts_as_price_model.currency
      currency = @acts_as_price_model.currency
      test_setter_in_doubles "#{currency}. 1.41", seperator
      test_setter_in_doubles "#{currency}. 1,41", seperator

      #test for special cases
      #test if 1.5 is returned as 1.50
      test_setter_in_doubles "#{currency}. 1.5", seperator
      test_setter_in_doubles "#{currency}. 1.505", seperator
      test_setter_in_doubles "#{currency}. 1.504", seperator
      #test if 1,5 is returned as 1.50
      test_setter_in_doubles "#{currency}. 1,5", seperator
      test_setter_in_doubles "#{currency}. 1,505", seperator
      test_setter_in_doubles "#{currency}. 1,504", seperator

      #test if float returns 2.05 correctly 
      #float can return 2.05 as 2.04 in some cases
      test_setter_in_doubles "#{currency}. 2.05", seperator
      
      #float can return 2,05 as 2.04 in some cases
      test_setter_in_doubles "#{currency}. 2,05", seperator
    else
      test_setter_in_doubles "1.41", seperator
      test_setter_in_doubles "1,41", seperator

      #test for special cases
      #test if 1.5 is returned as 1.50
      test_setter_in_doubles "1.5", seperator
      #test if 1,5 is returned as 1.50
      test_setter_in_doubles "1,5", seperator

      #test if float returns 2.05 correctly 
      #float can return 2.05 as 2.04 in some cases
      test_setter_in_doubles "2.05", seperator
      
      #float can return 2,05 as 2.04 in some cases
      test_setter_in_doubles "2,05", seperator
    end
    
    #test an empty_setter
    test_setter_in_cents "", seperator
    test_setter_in_doubles "", seperator
  end  
  
  # test if the setter sets the price correctly if price is given in integers
  def test_setter_in_cents cents, seperator
    columns_in_cents.each do |setter|
      @acts_as_price_model.send("#{setter}=", cents)
      columns_in_cents.each do |getter|
        @acts_as_price_model.send(getter).should == (cents.to_f + 0.5).to_i
      end
      columns_in_doubles.each do |getter|
        if cents == ""
          @acts_as_price_model.send(getter).should == ""
        else
          currency = @acts_as_price_model.currency
          if currency
            @acts_as_price_model.send(getter).should == currency + ". " + sprintf("%.2f", (cents.to_f / 100).to_s).gsub(".", seperator)
          else
            @acts_as_price_model.send(getter).should == sprintf("%.2f", (cents.to_f / 100).to_s).gsub(".", seperator)
          end
        end
      end
    end
  end
  
  # test if the setter sets the price correctly if price is given in doubles
  def test_setter_in_doubles double, seperator
    currency = @acts_as_price_model.currency
    double = double.gsub("#{currency}. ", "")
    columns_in_doubles.each do |setter|
      @acts_as_price_model.send("#{setter}=", double)
      columns_in_cents.each do |getter|
        @acts_as_price_model.send(getter).should == ((double.gsub(",", ".").to_f * 100) + 0.5).to_s.to_i
      end
      columns_in_doubles.each do |getter|
        if double == ""
          @acts_as_price_model.send(getter).should == ""
        else
          if currency
            @acts_as_price_model.send(getter).should == currency + ". " + sprintf("%.2f", (double.gsub(",", ".").to_f + 0.001).to_s).gsub(".", seperator)
          else
            @acts_as_price_model.send(getter).should == sprintf("%.2f", double.gsub(",", ".").to_s).gsub(".", seperator)
          end
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

end