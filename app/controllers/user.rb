get '/' do
 puts "homepage with welcome and either (1) login/sign up options or (2) start new round option if you are logged in"
end

get '/users/new' do
  puts "new user form"
end

post 'users/create' do
  puts "passes info from the form to ".create" new user"
end

post '/login' do
  puts "inputtype text with user name and password and a submit button"
  puts "it also sets a session id"
end

post '/logout' do
  puts "button that you press that'll delete the session id"
  puts "will also redirect to homepage"
end

get 'users/:id/results' do
  puts "display all results"
end
