get '/decks' do
  @decks = Deck.all
  erb :"/decks/show_all"
end

post '/decks/:deck_id/round/create' do
  # @user = User.find(session[:id]) if session[:id]
  @user = User.find(1) # replace with line above once login is implemented
  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user: @user, deck: @deck)
  @card = @round.next_card
  erb :"/decks/rounds/play"
end
