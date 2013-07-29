get '/login' do
  erb :login
end

get '/create_account' do
  erb :signup
end

get "/ballot/:user_id" do
  if params[:user_id].to_i == current_user.id
    @players1b = Player.pick_rand
    @players2b = Player.pick_rand
    @players3b = Player.pick_rand
    @playersss = Player.pick_rand
    @playerssp = Player.pick_rand
    @playersrp = Player.pick_rand
    @playersrf = Player.pick_rand
    @playerslf = Player.pick_rand
    @playerscf = Player.pick_rand
    @playersc = Player.pick_rand
    erb :user_page
  else
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  session[:round_id] = nil
  redirect to '/'
end

get '/completed/:ballot_id' do
  @ballot = Ballot.find_by_id(params[:ballot_id])
  erb :completed
end

post '/sign_in' do
  if user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    redirect "/ballot/#{user.id}"
  else
    erb :signin
  end
end

post '/sign_up' do
  user = User.new(params[:user])
  if user.save
    session.clear
    session[:user_id] = user.id
    redirect "/ballot/#{user.id}"
  else
    redirect '/'
  end
end

post '/user/:user_id' do
 ballot = Ballot.new(params[:ballot])
 ballot.user_id = current_user.id
 ballot.save
 redirect "/completed/#{ballot.id}"
end

# {"pname"=>["Babe Ruth", "Babe Ruth", "Andy Abad", "Fernando Abad", "Jeff Abbott", "Kurt Abbott", "Paul Abbott", "Reggie Abercrombie", "Brent Abernathy"], "splat"=>[], "captures"=>["2"], "user_id"=>"2"}
# 'http://api.espn.com/v1/sports?apikey=eygs8dv4fevn574zq68sbap8'
# apikey=eygs8dv4fevn574zq68sbap8'
