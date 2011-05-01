require 'rubygems'
require 'bundler'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

#desc 'Default: run unit tests.'
#task :default => :test
#
#desc 'Test the acts_as_price plugin.'
#Rake::TestTask.new(:test) do |t|
#  t.libs << 'lib'
#  t.libs << 'spec'
#  t.pattern = 'spec/**/*spec.rb'
#  t.verbose = true
#end

desc 'Generate documentation for the acts_as_price plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActsAsPrice'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include("README.rdoc")
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "acts_as_price"
    gem.homepage = "http://github.com/jeroeningen/acts_as_price"
    gem.license = "MIT"
    gem.summary = %Q{A specified database column acts as a price}
    gem.description = %Q{A specified database column acts as a price and creates on the fly methods like 'price' and 'price_in_cents'. For more information visit: http://github.com/jeroeningen/acts_as_price}
    gem.email = "jeroeningen@gmail.com"
    gem.authors = ["Jeroen van Ingen"]
    gem.add_runtime_dependency 'rails', '3.0.7'
    gem.add_development_dependency 'rspec-rails', '2.5.0'
    gem.add_development_dependency 'shoulda-matchers', '1.0.0.beta2'
    gem.add_development_dependency 'autotest', '4.4.6'
    gem.add_development_dependency 'rcov', '0.9.9'
    gem.add_development_dependency 'metrical', '0.0.5'
    gem.add_development_dependency 'activerecord-nulldb-adapter', '0.2.1'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler -s http://gemcutter.org"
end
Jeweler::RubygemsDotOrgTasks.new