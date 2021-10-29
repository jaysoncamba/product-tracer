class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    haml :home
  end

  helpers do
    def partial(page, options={})
      haml page.to_sym, options.merge!(:layout => false)
    end
  end
end