Gem::Specification.new do |s|
  s.name        = 'nest_api'
  s.version     = '0.0.1'
  s.date        = '2017-02-23'
  s.summary     = "Nest thermostat API Wrapper"
  s.description = "Simple API Wrapper for Nest Thermostats"
  s.authors     = ["Jessica Burns"]
  s.email       = 'jessburnsm@gmail.com'
  s.files       = ["lib/nest_api.rb", "lib/nest_api/access_token.rb", "lib/nest_api/api.rb", "lib/nest_api/thermostat.rb"]
  s.homepage    = 'http://rubygems.org/gems/nest_api'
  s.license     = 'MIT'
  s.add_dependency('httparty')
end
