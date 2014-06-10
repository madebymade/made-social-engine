$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "social"
  s.version     = Social::VERSION
  s.authors     = ["Chris Blackburn"]
  s.email       = ["chris@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk/"
  s.summary     = "Social media integration engine."
  s.description = "Rails engine that provides a number of pieces of functionality to interface with social media applications."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails",        "~> 3.2.11"
  s.add_dependency "twitter",      "~> 4.6.2"
  s.add_dependency "twitter-text", "~> 1.7.0"
  s.add_dependency "koala",        "~> 1.6.0"
  s.add_dependency "instagram",    "~> 1.1.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
