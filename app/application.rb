class Application < Sinatra::Application
  register Sinatra::ActiveRecordExtension
  require_relative './routes/product.rb'
  require_relative './routes/criteria.rb'
end