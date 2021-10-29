class ProductsController < ApplicationController
  get '/' do
    @products = Product.order(id: :desc)
    haml :"products/index"
  end

  get '/new' do
    @product = Product.new
    haml :"products/new"
  end

  post '/' do
    if params[:product][:id].present?
      @product =  Product.find(params[:product][:id])
      @product.update(params[:product])
    else
      @product = Product.create(params[:product])
    end
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