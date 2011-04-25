# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../../../../config/environment", __FILE__)

require 'rspec/rails'
require File.expand_path("../models/fueltype", __FILE__) 
require File.expand_path("../models/car", __FILE__) 

require 'nulldb_rspec'

include NullDB::RSpec::NullifiedDatabase

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