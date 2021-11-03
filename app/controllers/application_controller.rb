class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    haml :home
  end

  get "/search" do
    if params[:term]
      @product = Product.find_by reference: params[:term]
      @destination = ProductDestinationFinder.new(@product).find_product_destination
    end
    haml :home
  end

  helpers do
    def partial(page, options={})
      haml page.to_sym, options.merge!(:layout => false)
    end
  end
end