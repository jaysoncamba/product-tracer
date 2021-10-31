require './config/environment'

use Rack::MethodOverride
map('/products') { run ProductsController }
map('/criteria') { run CriteriaController }
map('/') { run ApplicationController }
