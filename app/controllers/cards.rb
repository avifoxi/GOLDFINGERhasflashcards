## GET REQUEST FOR NEW CARD FORM 

get "/decks/:deck_id/card/new" do
  @deck = Deck.find(params[:deck_id])
  erb :"decks/cards/new"

end

## CREATE NEW CARD
post "/decks/:deck_id/cards/create" do
	@card = Card.new(params[:card])
	@deck = Deck.find(params[:deck_id])
	if @card.save
		@deck.cards << @card
		redirect "/decks/#{@deck.id}"
	else
		@card.id = 0
		session[:error] = 'Card creation Error'
		erb :"decks/cards/edit"
	end
end

## GET EDIT FORM 

get '/decks/:deck_id/cards/:card_id/edit' do
 	@card = Card.find(params[:card_id])
	@deck = Deck.find(params[:deck_id])
	erb :"decks/cards/edit"
end

## EDIT  

patch '/decks/:deck_id/cards/:card_id/edit' do
	@deck = Deck.find(params[:deck_id])

 	## if card has ID of 0 - ie unsaved new with errors
 	
 	if params[:card_id] == 0
 		@card = Card.new(params[:card])
 	else
 		@card = Card.find(params[:card_id]) 
 	end
 
 	if @card.update_attributes(params[:card])
 		@deck.cards << @card
 		session[:error] = nil
 		redirect "/decks/#{@deck.id}"
 	else 
 		session[:error] = 'edit failure'
 		erb :"decks/cards/edit"
 	end

end