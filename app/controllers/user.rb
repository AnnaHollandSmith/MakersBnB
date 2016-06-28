class MakersBnB < Sinatra::Base
  get '/' do
    erb :'/index'
  end

  post '/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/spaces/spaces'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
