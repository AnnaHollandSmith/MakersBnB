

class MakersBnB < Sinatra::Base
  get '/spaces' do
    erb :'spaces/spaces'
  end
end
