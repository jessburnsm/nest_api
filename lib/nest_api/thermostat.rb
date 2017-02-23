module NestApi
  class Thermostat
    def initialize(device_id, token)
      @id = device_id
      @token = token
    end

    # Retrieve a property of a thermostat
    # If no property_id is supplied, all properties of the thermostat will be returned
    def get(property_id = '')
      HTTParty.get("#{NestApi::API_URL}/devices/thermostats/#{@id}/#{property_id}",  query: { auth: @token.access_token })
    end

    # Set a thermostat property to a new value
    def update!(property_id:, value:)
      HTTParty.put("#{NestApi::API_URL}/devices/thermostats/#{@id}",
        query: { auth: @token.access_token },
        body: { "#{property_id}" => value }.to_json,
        headers: { 'Content-Type' => 'application/json'
      })
    end
  end
end
