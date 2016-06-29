ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/space'
require_relative 'controllers/user'
require_relative 'controllers/session'
require_relative 'controllers/request'
require_relative 'server'
require_relative 'helpers'


class MakersBnB < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new { File.join(root, 'public')}

  include Helpers

  run! if app_file == $0
end
