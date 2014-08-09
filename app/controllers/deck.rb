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
  # @card = @round.next_card
  # erb :'/decks/rounds/play'
  redirect '/decks/rounds/play'
end

# get '/decks/rounds/play' do
#   # puts <<-TEXT
#   #   display the page youre going to play on
#   #   @round = Round.find(:id)
#   #   if @round.over? <-(we'll have to make this method)
#   #     redirect to users restuls
#   #   else
#   #     @card = @round.next_card <-(we'll have to make this method)
#   #     redirect to 'round/:id'
#   #  TEXT
#   puts "hi there"


#   erb :'/decks/rounds/play'
# end

