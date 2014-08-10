
get '/' do
 erb :'index'
end

post '/signup' do
  @user = User.create(name: params[:name], email: params[:email], password: params[:password])
  if @user.valid?
    session[:user_id] = @user.id
    redirect '/decks/show_all'
  else
    flash[:signup_errors] = form_error(@user.errors.messages)
    redirect '/'
  end
end

get '/login' do 
  erb :"users/login"
end

post '/login' do
  p params
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    
    if request.xhr?
      content_type :json
      return session[:user_id].to_json
    else
      redirect '/decks/show_all'
    end
  else
    flash[:signin_errors] = 'Invalid Login'
    redirect '/'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

### USER PROFILE PAGE // MISSION DEBRIEFINGS

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @decks = @user.authored_decks
  @rounds = @user.rounds

  erb :"users/profile"
end


## USERS DISPLAY PAGE // 00_ AGENTS









