class MakersBnB < Sinatra::Base
  get '/' do
    @user = User.new
    erb :'/index'
  end

  post '/new' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/spaces'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/index'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      redirect '/sessions/new'
    end

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
