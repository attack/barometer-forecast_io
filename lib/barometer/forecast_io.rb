require 'barometer'
require_relative 'forecast_io/version'
require_relative 'forecast_io/api'
require_relative 'forecast_io/response'

module Barometer
  class ForecastIo
    def self.call(query, config={})
      ForecastIo.new(query, config).measure!
    end

    def initialize(query, config={})
      @query = query
      @apikey = config[:keys][:api] if config[:keys]
    end

    def measure!
      validate_key!

      api = ForecastIo::Api.new(query, apikey)
      ForecastIo::Response.new.parse(api.get)
    end

    private

    attr_reader :query, :apikey

    def validate_key!
      unless apikey && !apikey.empty?
        raise Barometer::WeatherService::KeyRequired
      end
    end
  end
end

Barometer::WeatherService.register(:forecast_io, Barometer::ForecastIo)
