require 'sinatra'
require 'sinatra/activerecord'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peep_new' do
    erb :peep_new
  end

  post '/peep_post' do
    erb :peep_post
  end
end
