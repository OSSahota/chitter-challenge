require 'sinatra'
require 'sinatra/activerecord'
require './lib/account'
require './lib/peep'

class App < Sinatra::Base
  enable :sessions
  set :method_override, true

  get '/' do
    erb :index
  end

  get '/account_signup' do
    erb :account_signup
  end

  post '/account_signup' do
    session[:account] = Account.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])

    if session[:account].id == nil
      session[:account_feedback] = 'You failed to sign up'
      redirect '/unsuccessful'
    else
      redirect '/profile'
    end
  end

  get '/account_login' do
    erb :account_login
  end

  post '/account_login' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    session[:account] = Account.find_by(email: session[:email], password: session[:password])

    if session[:account] == nil
      session[:account_feedback] = 'You failed to log in'
      redirect '/unsuccessful'
    else
      redirect '/profile'
    end
  end

  get '/unsuccessful' do
      @account_feedback = session[:account_feedback]
      erb :unsuccessful
  end

  get '/account_logout' do
    session.clear
    redirect '/'
  end

  get '/profile' do
    @account = session[:account]
    erb :profile
  end

  get '/peep_new' do
    erb :peep_new
  end

  post '/peep_post' do
    session[:account_id] = session[:account].id
    session[:peep] = Peep.create(text: params[:peep])
    p session
    redirect '/peep_view'
  end

  get '/peep_view' do
    @account = Account.all
    @peep = Peep.all
    erb :peep_view
  end
end
