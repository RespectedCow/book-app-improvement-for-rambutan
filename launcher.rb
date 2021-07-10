# Imports
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

require './models/user'
require './models/organization'

enable :sessions

#Helpers
helpers do
    def log_in(user)
      # think of session like a Ruby hash to store data
      session[:user_id] = user.id
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def user_signed_in?
      !current_user.nil?
    end
end

#Variables

# Routes
get '/' do
    if user_signed_in?
      erb :home
    else
      redirect '/about'
    end
end

get '/about' do
  erb :about
end

post '/sign-out' do
  session.clear
  @current_user = nil
  redirect '/'
end

get '/sign-in' do
  erb :signin
end

post '/sign-in' do
  # check the password
  # return the first user with the specified email, nil otherwise
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    log_in(@user)
    redirect '/dashboard'
  else
    erb :sign_in
  end
end

get '/sign-up' do
  @user = User.new
  erb :signup
end

post '/sign-up' do
  # process the sign up data
  @user = User.new
  @user.full_name = params[:full_name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]

  if @user.save
    log_in(@user)
    redirect '/'
  else
    erb :signup
  end
end

get '/create/organization' do
  if user_signed_in?
    @organization = @current_user.organizations.build
    erb :create_organization
  else
    redirect '/sign-up'
  end
end

get '/create/books' do
  "404 this page aint created yet douche bag!"
end

get '/home' do
  erb :home
end

get '/dashboard' do
  erb :dashboard
end

get '/books' do
    erb :books
end