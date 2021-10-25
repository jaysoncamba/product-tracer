get '/products' do
  @products = Product.all
  erb 'products/index'
end