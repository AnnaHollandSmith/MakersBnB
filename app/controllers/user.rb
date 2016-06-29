class MakersBnB < Sinatra::Base
  get '/' do
    @user = User.new
    erb :'/index'
  end

  post '/new' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/spaces'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/index'
    end
  end

end
