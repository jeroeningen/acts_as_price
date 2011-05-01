#car model
class Car < ActiveRecord::Base
  validates :brand, :presence => true
  validates :cartype, :presence => true
  
  acts_as_price :price, :comma_seperated => true, :currency => "EUR"
end
