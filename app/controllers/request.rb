class MakersBnB < Sinatra::Base

  post '/requests' do
    space = Space.get(params[:id])
    request = Request.create(start_date: params[:start_date],
                             end_date: params[:end_date],
                             user_id: current_user.id,
                             space_id: params[:space_id],
                             approval: 'Pending')
    redirect('/requests')
  end

  get '/requests' do
    @requests_made = Request.all(user: current_user)
    @requests_received = Request.all(space: Space.all(user: current_user))
    erb :'requests/index'
  end

  get '/requests/:id' do
    @request = Request.get(params[:id])
    erb :'confirmation/new'
  end

  put '/requests/:id' do

  end
  post '/approve' do
    redirect('/requests')
  end


# @current_request = Request.all(space: Space.all(user: current_user))

end
