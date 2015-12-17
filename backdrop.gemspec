$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "backdrop/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "act_as_backdrop"
  s.version     = Backdrop::VERSION
  s.authors     = ["Grigoriy Dobryakov"]
  s.email       = ["grigoriydobryakov@gmail.com"]
  s.homepage    = "https://github.com/dobryakov/acts_as_backdrop"
  s.summary     = "Async processing of model changes"
  s.description = "This gem allows you to write async processing code to your models right into your models code"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
