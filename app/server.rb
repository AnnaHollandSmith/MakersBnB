class MakersBnB < Sinatra::Base
  set :views, File.expand_path('../views', __FILE__)

  # start the server if ruby file executed directly
  run! if app_file == $0
end
