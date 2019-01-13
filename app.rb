require 'sinatra'
require 'sinatra/activerecord'
require './lib/account'

class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/account_signup' do
    erb :account_signup
  end

  post '/account_signup' do
    # session[:email] = params[:email]
    # session[:password] = params[:password]
    # session[:name] = params[:name]
    # session[:username] = params[:username]

    session[:account] = Account.create(email: params[:email], password:
      params[:password], name: params[:name], username: params[:username])

    redirect :profile
  end

  get '/profile' do
    @name = session[:account].name
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
