class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    @today = (Date.today).to_s
    @tomorrow = (Date.today + 1).to_s
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(name: params[:name],
                         description: params[:description],
                         price: params[:price],
                         user: current_user,
                         date_from: params[:date_from],
                         date_to: params[:date_to],
                         photo: params[:photo][:filename])

    validate_space_availability(params[:date_from], params[:date_to], '/spaces/new')
    Space.upload_photo(params[:photo][:filename],
                       params[:photo][:tempfile])
    redirect to('/spaces')
  end

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    erb :'spaces/view'
  end

end
