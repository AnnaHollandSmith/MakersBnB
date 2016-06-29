class MakersBnB < Sinatra::Base
  
  post '/requests' do
    redirect('/requests')
  end

  get '/requests' do
    erb :'requests/index'
  end

end