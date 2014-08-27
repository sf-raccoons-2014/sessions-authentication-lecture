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
  user = User.new(params)
  if user.save
    session[:user_id]=user.id
  else
    flash[:error]=user.errors.full_messages
  end
  redirect '/'
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/secret'
  else
    flash[:errors] = "Try again"
    erb :index
  end

end

get '/logout' do
  session[:user_id]=nil
  redirect '/'
end
