class MakersBnB < Sinatra::Base
  get '/' do
    erb :'/index'
  end

  post '/new' do
    @user = User.create(email: params[:email], password: params[:password])
  end
end
