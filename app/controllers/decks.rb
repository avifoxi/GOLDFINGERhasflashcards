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
  # if session[:user_id] direct to NEW form
  # else say - sorry bub, gotta be logged in   

  erb :"/decks/new"
end

post '/decks/create' do
  # @user = User.find(session[:user_id])
  @deck = Deck.create(params[:deck])
  # @user.authored_decks << @deck

  redirect "/decks/#{@deck.id}"
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards ||= [Card.new(question: 'What will the first card be?')]
  erb :"decks/show_one"

end




