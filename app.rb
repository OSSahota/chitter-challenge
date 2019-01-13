require 'sinatra'
require 'sinatra/activerecord'
require './lib/account'
require './lib/peep'

class App < Sinatra::Base
  enable :sessions
  # set :method_override, true

  get '/' do
    erb :index
  end

  get '/account_signup' do
    erb :account_signup
  end

  post '/account_signup' do
    session[:account] = Account.create(email: params[:email], password:
      params[:password], name: params[:name], username: params[:username])

    redirect :profile
  end

  get '/profile' do
    @account = session[:account]

    erb :profile
  end

  get '/peep_new' do
    erb :peep_new
  end

  post '/peep_post' do
    session[:peep] = Peep.create(text: params[:peep])

    redirect '/peep_view'
  end

  get '/peep_view' do
    @account = Account.all
    @peep = Peep.all

    erb :peep_view
  end

end
