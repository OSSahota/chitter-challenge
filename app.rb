require 'sinatra'
require 'sinatra/activerecord'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/user_signup' do
    erb :user_signup
  end

  post '/user_signup' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:name] = params[:name]
    session[:username] = params[:username]
    # p params
    # p session
    redirect :profile
  end

  get '/profile' do
    erb :profile
  end

  get '/peep_new' do
    erb :peep_new
  end

  post '/peep_post' do
    session[:peep] = params[:peep]
    # session[:name] = params[:name]
    # session[:username] = params[:username]
    # p params
    # p session
    redirect '/peep_view'
  end

  get '/peep_view' do
    @peep = session[:peep]
    @name = session[:name]
    @username = session[:username]
    erb :peep_view
  end
end
