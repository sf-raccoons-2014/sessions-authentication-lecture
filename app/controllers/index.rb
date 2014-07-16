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
  user= User.find_by_email (params[:email])
  # Need to verify password
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = "Try again"
    erb :index
  end

end

post '/logout' do
  session[:user_id]=nil
  redirect '/'
end
