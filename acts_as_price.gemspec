# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_price}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeroen van Ingen"]
  s.date = %q{2011-04-28}
  s.description = %q{A specified database column acts as a price and creates on the fly methods like 'price' and 'price_in_cents'. For more information visit: http://github.com/jeroeningen/acts_as_price}
  s.email = %q{jeroeningen@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "init.rb",
    "install.rb",
    "lib/acts_as_price.rb",
    "lib/acts_as_price_helper.rb",
    "spec/car_spec.rb",
    "spec/fueltype_spec.rb",
    "spec/models/car.rb",
    "spec/models/fueltype.rb",
    "spec/spec_helper.rb",
    "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/jeroeningen/acts_as_price}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A specified database column acts as a price}
  s.test_files = [
    "spec/car_spec.rb",
    "spec/fueltype_spec.rb",
    "spec/models/car.rb",
    "spec/models/fueltype.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 3.0.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_runtime_dependency(%q<rails>, ["= 3.0.7"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_development_dependency(%q<autotest>, [">= 0"])
      s.add_development_dependency(%q<autotest-growl>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<metrical>, [">= 0"])
      s.add_development_dependency(%q<activerecord-nulldb-adapter>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["= 3.0.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rails>, ["= 3.0.7"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_dependency(%q<autotest>, [">= 0"])
      s.add_dependency(%q<autotest-growl>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<metrical>, [">= 0"])
      s.add_dependency(%q<activerecord-nulldb-adapter>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.0.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rails>, ["= 3.0.7"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<shoulda-matchers>, [">= 0"])
    s.add_dependency(%q<autotest>, [">= 0"])
    s.add_dependency(%q<autotest-growl>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<metrical>, [">= 0"])
    s.add_dependency(%q<activerecord-nulldb-adapter>, [">= 0"])
  end
end

