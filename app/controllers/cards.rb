get "/decks/:deck_id/card/new" do
  @deck = Deck.find(params[:deck_id])
  erb :"decks/cards/new"

end

post "/decks/:deck_id/card/create" do
 
  erb :"decks/cards/new"
end

get '/decks/:deck_id/card/edit' do 

	'i am a card. update me please'
end