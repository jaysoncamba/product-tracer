require 'rubygems'
require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'ffaker'
require_relative '../app'

Dir["factories/*.rb"].each { |file| require_relative file }

ENV['RACK_ENV'] = 'test'

RSpec.configure do |conf|

  conf.include Rack::Test::Methods
  conf.include FactoryGirl::Syntax::Methods

  conf.before(:suite) do
    FactoryGirl.find_definitions
  end
end