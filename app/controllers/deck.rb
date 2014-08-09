get '/decks/show_all' do
  @decks = Deck.all
  erb :"/decks/show_all"
end

post '/decks/:deck_id/round/create' do
  # @user = User.find(session[:id]) if session[:id]
  @user = User.find(1) # replace with line above once login is implemented
  @deck = Deck.find(params[:id])
  @round = Round.create(user: @user, deck: @deck)
  session[:round_id] = @round.id
  redirect '/decks/rounds/play'
end

get '/decks/new' do 
	puts "I'm a logged in user, and I wanna make me a new deck. Whoop!"

end
