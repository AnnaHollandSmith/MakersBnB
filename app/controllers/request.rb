class MakersBnB < Sinatra::Base

  post '/requests' do
    space = Space.get(params[:id])
    request = Request.create(start_date: params[:start_date],
                             end_date: params[:end_date],
                             user_id: current_user.id,
                             space_id: params[:space_id])
    redirect('/requests')
  end

  get '/requests' do
    @requests = Request.all(user_id: current_user)
    erb :'requests/index'
  end

end
