class ProductsController < ApplicationController
  get '/' do
    @products = Product.all
    haml :"products/index"
  end

  get '/new' do
    @product = Product.new
    haml :"products/new"
  end

  post '/' do
    @product = Product.find_or_initialize_by(id: params[:product][:id])
    @product.update(params[:product])
    redirect to "/#{@product.id}"
  end

  get '/:id/edit' do
    @product = Product.find params[:id]
    haml :"products/edit"
  end

  get '/:id/destroy' do
    Product.destroy params[:id]
    redirect to "/"
  end

  get '/:id' do
    @product = Product.find params[:id]
    haml :"products/show"
  end
end