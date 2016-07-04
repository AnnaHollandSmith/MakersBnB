require_relative 'helpers'

class MakersBnB < Sinatra::Base



  set :views, File.expand_path('../views', __FILE__)
  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new { File.join(root, 'public')}


  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  include Helpers

  register Sinatra::Flash

  run! if app_file == $0



end
