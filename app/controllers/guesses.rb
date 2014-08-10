## CREATE GUESS WITH INPUT - IF NO INPUT NOT CREATE


post '/rounds/:round_id/card/:card_id/guess' do
  @round = Round.find(params[:round_id])
  @card = Card.find(params[:card_id])

  @guess = @card.guesses.create(params[:guess])
  @round.guesses << @guess

  redirect "/rounds/#{@round.id}/play"

end
