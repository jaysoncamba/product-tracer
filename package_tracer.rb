require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'
require "pg"

Dir["app/models/**/*.rb"].each { |file| require_relative file }
Dir["app/modules/**/*.rb"].each { |file| require_relative file }
# Dir["app/views/**/*.erb"].each { |file| require_relative file }

require_relative "config/initialize"
require_relative "app/application"