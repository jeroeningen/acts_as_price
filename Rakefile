require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the acts_as_price plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  t.pattern = 'spec/*_spec.rb'
  t.verbose = true
end

desc 'Generate documentation for the acts_as_price plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActsAsPrice'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include("README.rdoc")
  rdoc.rdoc_files.include('lib/**/*.rb')
end