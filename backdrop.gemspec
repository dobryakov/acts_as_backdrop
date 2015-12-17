$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "backdrop/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "backdrop"
  s.version     = Backdrop::VERSION
  s.authors     = ["Grigoriy Dobryakov"]
  s.email       = ["grigoriydobryakov@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Backdrop."
  s.description = "TODO: Description of Backdrop."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
