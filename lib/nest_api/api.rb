module NestApi
  class Api
    def initialize(product_id: ENV.fetch("NEST_PRODUCT_ID"), product_secret: ENV.fetch("NEST_PRODUCT_SECRET"), file: NestApi::CONFIG_FILE)
      @token = NestApi::AccessToken.new(product_id, product_secret, file)
    end

    # Retrieve a list of all thermostats registered to this account
    def get_thermostat_list
      create_thermostats(HTTParty.get("#{NestApi::API_URL}/devices/thermostats", query: { auth: @token.access_token }))
    end

    # Retrieve a single thermostat by name
    def get_thermostat_by_name(name)
      get_thermostat_list[name]
    end

    private

    # Transform the nest api thermostats reponse into NestApi::Thermostat objects
    def create_thermostats(thermostat_list)
      thermostat_list.map { |device, info| [ info['name'], NestApi::Thermostat.new(device, @token) ] }.to_h
    end
  end
end
