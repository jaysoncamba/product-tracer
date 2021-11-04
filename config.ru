require './app'

use Rack::MethodOverride
map('/products') { run ProductsController }
map('/criteria') { run CriteriaController }
map('/') { run ApplicationController }
