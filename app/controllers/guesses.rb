# post 'round/:round_id/card/:card_id/guess/create' do
#   puts "@guess = Guess.create(params)"
#   puts "redirect to round/:round_id"
# end

post '/rounds/:round_id/card/:card_id/guess' do
  @round = Round.find(params[:round_id])
  @card = Card.find(params[:card_id])

  # determine if there is user_input
  # if no - redir somewhere

  #if yes - create guess
  @guess = @card.guesses.create(params[:guess])
  @round.guesses << @guess

  redirect "/rounds/#{@round.id}/play"


end
