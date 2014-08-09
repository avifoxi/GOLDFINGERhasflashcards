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
    @errors = @user.errors
    erb :'index'
  end
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/decks/show_all'
  else
    erb :'index'
  end
end

post '/logout' do
  puts "button that you press that'll delete the session id"
  puts "will also redirect to homepage"
end

get '/users/:id/results' do
  puts "display all results"
end
