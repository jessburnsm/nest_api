require 'HTTParty'
require 'json'

require_relative 'nest_api/access_token'
require_relative 'nest_api/api'
require_relative 'nest_api/thermostat'

module NestApi
  CONFIG_FILE = './nest_config'

  API_URL = 'https://developer-api.nest.com'
  AUTH_URL = 'https://home.nest.com/login/oauth2?state=STATE&client_id='
  TOKEN_URL = 'https://api.home.nest.com/oauth2/access_token'

  ConfigurationError = Class.new(StandardError)
end
