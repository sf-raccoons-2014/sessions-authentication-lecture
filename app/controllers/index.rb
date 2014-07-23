

get '/' do
  erb :index
end

get '/secret' do
  if !logged_in?
    redirect '/'
  end
  erb :secret
end

# ============SESSIONS

post '/signup' do
  user = User.create(params)
  session[:user_id]=user.id
  p " Session: #{session}"
  redirect '/'
end

post '/login' do
  # Need to verify password
  if User.authenticate(params)
    session[:user_id] = user.id
    redirect '/secret'
  else
    @errors = "Try again"
    erb :index
  end

end

post '/logout' do
  session[:user_id]=nil
  redirect '/'
end
