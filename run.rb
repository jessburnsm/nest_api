# Load my Nest config
require 'dotenv'
Dotenv.load

require 'nest_api'

nest = NestApi::Api.new

# Get all thermostats
puts nest.get_thermostat_list

# Get one thermostat
puts nest.get_thermostat_by_name('dev')

# Get thermostat value
puts nest.get_thermostat_by_name('dev').get('target_temperature_high_f')

# Update thermostat
puts dev.update!(property_id: 'target_temperature_high_f', value: 75)
