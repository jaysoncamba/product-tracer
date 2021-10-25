set :environments, %w{development}
set :views, 'app/views'


Dir["#{File.dirname(__FILE__)}/initializers/*.rb"].each do |file|
  require_relative file
end