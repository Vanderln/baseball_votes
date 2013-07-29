get '/' do
  erb :index
end


get '/signup' do
  erb :signup
end

# http://api.espn.com

get '/player' do
  route_chunk = params[:player_data]



end
