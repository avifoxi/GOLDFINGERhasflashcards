get "/decks/:deck_id/card/new" do
  @deck = Deck.find(params[:deck_id])
  erb :"decks/cards/new"

end

post "/decks/:deck_id/card/create" do
	@card = Card.new(params[:card])
	@deck = Deck.find(params[:deck_id])
	if @card.save
		@deck.cards << @card
		redirect "/decks/#{@deck.id}"
	else
		session[:error] = 'Card creation Error'
		erb :"decks/cards/edit"
	end

 
  # erb :"decks/cards/new"
end

get '/decks/:deck_id/card/:card_id/edit' do 

	erb :"decks/cards/edit"
end