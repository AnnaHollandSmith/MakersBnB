class MakersBnB < Sinatra::Base

  get '/requests' do
      @requests_made = Request.all(user: current_user)
      @requests_received = Request.all(space: Space.all(user: current_user))
      erb :'requests/index'
    end

  post '/requests' do
    @space = Space.get(params[:space_id])
    if params[:start_date] > params[:end_date]
      flash.next[:errors] = ['Invalid date range!']
      redirect('spaces')
    else
    Request.create(start_date: params[:start_date],
                    end_date: params[:end_date],
                    user: current_user,
                    space_id: params[:space_id],
                    confirmed: 0)
    redirect('/requests')
    end
  end

  get '/requests/:id' do
    @active_request = Request.first(id: params[:id])
    erb :'requests/view'
  end

  post '/requests-confirmed/:id' do
    @active_request = Request.first(id: params[:id])
    @active_request.confirmed = 2
    @active_request.save
    redirect('/requests')
  end

  post '/requests-denied/:id' do
    @active_request = Request.first(id: params[:id])
    @active_request.confirmed = 1
    @active_request.save
    redirect('/requests')
  end

  post '/approve' do
    redirect('/requests')
  end


end
