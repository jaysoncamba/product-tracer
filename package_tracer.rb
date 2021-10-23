require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require 'pry'
require "pg"

DB = PG.connect({ dbname: 'inventory', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  "Andrew Ford Medina."
end