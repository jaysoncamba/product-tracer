require 'bundler/setup'

ActiveRecord::Base.logger = Logger.new(STDOUT)

configure :development do |c|   
  require 'sinatra/reloader'
   c.also_reload "./app/models/*.rb" 
   c.also_reload "./app/controllers/*.rb"
   c.also_reload "./app/modules/*.rb"
end

require_all 'app'