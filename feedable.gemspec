$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feedable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feedable"
  s.version     = Feedable::VERSION
  s.authors     = ["cavis"]
  s.email       = ["ryancavis@gmail.com"]
  s.homepage    = "https://github.com/rtanc/feedable"
  s.summary     = "Generate an activity feed from several ActiveRecord models, without the need for extra activity tables"
  s.description = "Create a composite feed of 'recent activity' from multiple models in your rails app.  They will be sorted by a datetime column (usually created_at).  This removes the need for insert hooks to create 'activity' in an extra table."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency('rails', '>= 3.0.0')
  s.add_dependency('activerecord', '>= 3.0.0')
  s.add_dependency('activemodel', '>= 3.0.0')
  s.add_dependency('activesupport', '>= 3.0.0')

  s.add_development_dependency "sqlite3"
end
