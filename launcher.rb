# Imports
require 'sinatra'
require 'sinatra/reloader' if development?

# Routes
get '/' do
    erb :home
end

get '/books' do
    erb :books
end