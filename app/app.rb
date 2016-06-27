ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'controllers/user'

class MakersBnB < Sinatra::Base
set :views, File.expand_path('../views', __FILE__)
  get '/' do
    'Hello MakersBnB!'
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
