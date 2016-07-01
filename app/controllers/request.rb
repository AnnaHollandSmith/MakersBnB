class MakersBnB < Sinatra::Base

  get '/requests' do
      @requests_made = Request.all(user: current_user)
      @requests_received = Request.all(space: Space.all(user: current_user))
      erb :'requests/index'
    end

  post '/requests' do

    Request.create(start_date: params[:start_date],
                    end_date: params[:end_date],
                    user: current_user,
                    space_id: params[:space_id],
                    confirmed: 0)
    validate_request_dates(params[:start_date], params[:end_date], params[:space_id])
    redirect('/requests')
  end

  get '/requests/:id' do
    @active_request = Request.first(id: params[:id])
    erb :'requests/view'
  end

  post '/requests/confirm/:id' do
    Request.first(id: params[:id]).update(confirmed: 2)
    request = Request.get(params[:id])
    Booking.create(start_date: request.start_date,
                   end_date: request.start_date,
                   user: current_user,
                   space: request.space)
    redirect('/requests')
  end

  post '/requests/deny/:id' do
    Request.first(id: params[:id]).update(confirmed: 1)
    redirect('/requests')
  end

  post '/approve' do
    redirect('/requests')
  end


end
