require './config/environment'
require './app/models/sample_model'
require './app/models/transmogrifier'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  get '/secret' do 
    return "You found the secret"
  end 
  
  get '/treasure' do 
    return mutate("Fear no evil!")
  end 
  
  get '/end' do 
    return erb :results 
  end
  
  post '/result' do
    puts params.to_s
    userphrase = params["catchphrase"]
    @finalphrase = mutate(userphrase)
    return erb :results
  end
end
