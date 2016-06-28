ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'controllers/space'
require_relative 'controllers/user'
require_relative 'server'


class MakersBnB < Sinatra::Base
set :views, File.expand_path('../views', __FILE__)

enable :sessions
set :session_secret, 'super secret'

  # start the server if ruby file executed directly
  run! if app_file == $0
end
