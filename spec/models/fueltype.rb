#fueltype model
class Fueltype < ActiveRecord::Base
  validates :name, :presence => true
  
  acts_as_price :price_per_liter, :validates => true
end