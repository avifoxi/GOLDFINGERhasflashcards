get '/decks/show_all' do
  @decks = Deck.all
  erb :"/decks/show_all"
end


get '/decks/new' do
  # if session[:user_id] direct to NEW form
  # else say - sorry bub, gotta be logged in   

  erb :"/decks/new"
end

post '/decks/create' do
  @user = User.find(session[:user_id])
  @deck = Deck.create(params[:deck])
  @user.authored_decks << @deck

  redirect "/decks/#{@deck.id}"
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards ||= [Card.new(question: 'What will the first card be?')]
  erb :"decks/show_one"

end




