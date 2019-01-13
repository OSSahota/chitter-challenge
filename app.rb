require 'sinatra'
require 'sinatra/activerecord'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peep_new' do
    erb :peep_new
  end

  post '/peep_post' do
    session[:peep] = params[:peep]
    session[:user] = params[:user]
    # p params
    # p session
    redirect '/peep_view'
  end

  get '/peep_view' do
    @peep = session[:peep]
    @user = session[:user]
    erb :peep_view
  end
end
