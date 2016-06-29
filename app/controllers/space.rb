class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], user: current_user, date_from: params[:date_from], date_to: params[:date_to])
    current_user.spaces << space
    current_user.save
    redirect to('/spaces')
  end
end
