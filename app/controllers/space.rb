class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], user: current_user)
    current_user.spaces << space
    current_user.save
    redirect to('/spaces')
  end
end

a chitter user has many chits
a bnb user has many spaces
