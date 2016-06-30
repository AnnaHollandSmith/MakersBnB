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
    @confirm_view = session[:confirm_view]
    erb :'requests/index'
  end

  post '/confirmation' do
    session[:confirm_view] = true
    @confirm_view = session[:confirm_view]
    session[:current_request] = request
     redirect('/requests')
  end

  post '/approve' do
    session[:confirm_view] = false
    session[:current_request].approval = 'Approved'
    redirect('/requests')
  end

  post '/deny' do
    session[:confirm_view] = false
    session[:current_request].approval = 'Denied'
    redirect('/requests')
  end

# @current_request = Request.all(space: Space.all(user: current_user))

end
