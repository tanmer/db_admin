$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "db_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "db_admin"
  s.version     = DbAdmin::VERSION
  s.authors     = ["xiaohui"]
  s.email       = ["xiaohui@zhangxh.net"]
  s.homepage    = "https://github.com/tanmer/db_admin"
  s.summary     = "Manage DB from API and GUI"
  s.description = "Manage DB from API and GUI."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "activerecord", "~> 5.2.1"
  s.add_dependency "request_store", '~> 1.4', '>= 1.4.1'
end
