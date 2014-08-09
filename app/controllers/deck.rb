get '/decks/show_all' do
  @decks = Deck.all
  erb :"/decks/show_all"
end

post '/decks/:deck_id/round/create' do
  @user = User.find(session[:user_id]) if session[:user_id]
  @deck = Deck.find(params[:id])
  @round = Round.create(user: @user, deck: @deck)
  session[:round_id] = @round.id
  redirect '/decks/rounds/play'
end

