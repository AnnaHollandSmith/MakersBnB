class MakersBnB < Sinatra::Base
  set :views, File.expand_path('../views', __FILE__)

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  # start the server if ruby file executed directly
  run! if app_file == $0
end
