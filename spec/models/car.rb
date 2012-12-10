#car model
class Car < ActiveRecord::Base
  [:brand, :cartype, :model].each do |attrib|
    validates attrib, :presence => true
  end
  
  acts_as_price :price, :comma_seperated => true, :currency => "EUR"
end
