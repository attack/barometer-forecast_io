# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'barometer/forecast_io/version'

Gem::Specification.new do |spec|
  spec.name = 'barometer-forecast_io'
  spec.version = Barometer::ForecastIo::VERSION
  spec.authors = ['Mark Gangl']
  spec.email = ['mark@attackcorp.com']
  spec.description = 'A barometer adapter for Forecast.io'
  spec.summary = spec.description
  spec.homepage = 'http://github.com/attack/barometer-forecast_io'
  spec.license = 'MIT'

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 1.9.2'

  spec.files = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_dependency 'barometer', '~> 0.9.3'

  spec.add_development_dependency 'bundler'
end
