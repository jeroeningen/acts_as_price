# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require 'rails/all'
require 'rspec/rails'
require File.expand_path("../../lib/acts_as_price", __FILE__) 
require File.expand_path("../../lib/acts_as_price_helper", __FILE__) 
require File.expand_path("../models/fueltype", __FILE__) 
require File.expand_path("../models/car", __FILE__) 

# require 'nulldb_rspec'

# include NullDB::RSpec::NullifiedDatabase

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)
ActiveRecord::Migrator.up "db/migrate"
ActiveRecord::Migration.create_table :cars do |t|
  t.string :brand
  t.string :cartype
  t.string :model
  t.integer :price
  t.timestamps
end
ActiveRecord::Migration.create_table :fueltypes do |t|
  t.string :name
  t.integer :price_per_liter
  t.timestamps
end

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  
  #load helper methods
  config.include(ActsAsPriceHelper)
end