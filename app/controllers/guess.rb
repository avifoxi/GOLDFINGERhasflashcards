# post 'round/:round_id/card/:card_id/guess/create' do
#   puts "@guess = Guess.create(params)"
#   puts "redirect to round/:round_id"
# end

post '/answer' do
  @round = Round.find(session[:round_id])
  @guess = Guess.find(session[:guess_id])
  @guess.user_input = params[:user_input]
  @guess.save

  if @round.over?
    redirect '/decks/rounds/results'
  else
    @card = @round.next_card
    @guess = Guess.create(round_id: @round.id, card_id: @card.id, user_input: "need input")
    session[:guess_id] = @guess.id
    erb :'/decks/rounds/play'
  end

end
