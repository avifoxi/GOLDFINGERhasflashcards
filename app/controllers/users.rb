
get '/' do
 puts "homepage with welcome and either:"
 puts "(1) login/sign up options or "
 puts "(2) start new round option if you are logged in"
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

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/decks/show_all'
  else
    flash[:signin_errors] = 'Invalid Login'
    redirect '/'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/users/:id/results' do
  puts "display all results"
end
