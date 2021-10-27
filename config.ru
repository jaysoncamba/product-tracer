require 'sinatra/base'
require 'sinatra/activerecord'
require 'pry'
require "pg"
require 'haml'
require 'require_all'
require './config/environment'

use Rack::MethodOverride
map('/products') { run ProductsController }
map('/criteria') { run CriteriaController }
map('/') { run ApplicationController }
