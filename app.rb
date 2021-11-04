require 'sinatra/base'
require 'sinatra/activerecord'
require 'pry'
require "pg"
require 'haml'
require 'bundler/setup'
require 'require_all'
ActiveRecord::Base.logger = Logger.new(STDOUT)
require_all 'app'