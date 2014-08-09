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
  
  erb :"/decks/new"
end

post '/decks/create' do 
  # @user = User.find(session[:user_id])
  @deck = Deck.create(params[:deck])
  # @user.decks << @deck

  redirect "/decks/#{@deck.id}"
end

get '/decks/undies' do 
  'nu?'
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards ||= Card.new(question: 'What will your first card be?')
  erb :"decks/show_one"

end

get "/decks/:deck_id/card/new" do


end


