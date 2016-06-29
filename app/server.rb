class MakersBnB < Sinatra::Base
  set :views, File.expand_path('../views', __FILE__)

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  run! if app_file == $0
end
