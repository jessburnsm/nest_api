# Nest API

This is a Ruby wrapper for the Nest API ( https://developers.nest.com/documentation/api-reference ). It currently handles:
- PIN Based authentication
- Thermostat class to abstract GET & POST requests

## Todos
- Add more error handling
- Add tests to repo

## Getting started

Nest requires that you have a developer account and create a new product in order to interact with your thermostat(s). Once you have created the product ( https://developers.nest.com/products ) Grab the Product ID and Product Secret keys. It is best to put these values in an environment variable in your project ( as NEST_PRODUCT_ID and NEST_PRODUCT_SECRET, respectively), but is not necessary to use this gem.

Grab the latest version of the gem at: https://rubygems.org/gems/nest_api

To install from the command line, run:
```
gem install nest_api
```

## Usage
In your code, you can simply use:
```
require 'nest_api'
nest = NestApi::Api.new
nest.get_thermostat_list
```
To retrieve a list of all thermostats registered to your Nest account.

`NestApi::Api.new` accepts three optional keyword arguments: product_id, product_secret, and file.
```
require 'nest_api'
NestApi::Api.new(product_id: 'product123', product_secret: 'secret123', file: './filename')
```
If you did not put your Nest credentials in your environment variable, you must provide them when you initialize the Api class. The filename parameter is automatically set to `./nest_config`, but can be changed to any file on your system.

The first time you call a request on the Api class, you will be prompted to enter a PIN code from the Nest site. Once you have done so, your access credentials will be stored on your filesystem and will be automatically read for future API calls.

It is best to provide an initialization script that does this so your program is not interrupted with a user prompt.

## Examples
See `run.rb` for these examples as well.

Getting all thermostats for the Nest account:
```
require 'nest_api'
nest = NestApi::Api.new
puts nest.get_thermostat_list
```

Retrieving a specific thermostat by name:
```
require 'nest_api'
nest = NestApi::Api.new
puts nest.get_thermostat_by_name('my thermostat')
```

Retrieving a specific thermostat's data:
```
require 'nest_api'
nest = NestApi::Api.new
puts nest.get_thermostat_by_name('my thermostat').get('target_temperature_high_f')
```

Updating a specific thermostat's data:
```
require 'nest_api'
nest = NestApi::Api.new
puts nest.get_thermostat_by_name('my thermostat').update!(property_id: 'target_temperature_high_f', value: 75)
```
