require 'sinatra'
require 'sinatra/activerecord'
require './lib/account'
require './lib/peep'

class App < Sinatra::Base
  enable :sessions
  set :method_override, true

  attr_accessor :account_feedback

  get '/' do
    erb :index
  end

  get '/account_signup' do
    erb :account_signup
  end

  post '/account_signup' do
    session[:account] = Account.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    # p session[:account]

    # if email already exists then id will be nil from above output. This
    # will locate the FULL record. Should separate when working on log in.
    if session[:account].id == nil
      session[:account_feedback] = 'You failed to sign up'
      # session[:account] = Account.find_by(email: session[:account].email)
      # p session[:account]
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
    # p session[:account]
    if session[:account] == nil
      session[:account_feedback] = 'You failed to log in'
      redirect '/unsuccessful'
    else
      redirect '/profile'
    end
  end

  get '/profile' do
    @account = session[:account]
    # p @account
    erb :profile
  end

  get '/unsuccessful' do
      @account_feedback = session[:account_feedback]
      erb :unsuccessful
  end

  get '/peep_new' do
    erb :peep_new
  end

  post '/peep_post' do
    session[:account_id] = session[:account].id

    session[:peep] = Peep.create(text: params[:peep])

    redirect '/peep_view'
  end

  get '/peep_view' do
    @account = Account.all
    @peep = Peep.all

    erb :peep_view
  end

end
