class ProductsController < ApplicationController
  get '/' do
    haml :"products/index"
  end
end