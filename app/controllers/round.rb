get '/decks/rounds/play' do

  @round = Round.find(session[:round_id])
  @card = @round.next_card
  @guess = Guess.create(round_id: @round.id, card_id: @card.id, user_input: "need input")
  session[:guess_id] = @guess.id

  erb :'/decks/rounds/play'
end

get '/decks/rounds/results' do

  @round = Round.find(session[:round_id])
  erb :'/decks/rounds/results'
end

  # puts <<-TEXT
  #   display the page youre going to play on
  #   @round = Round.find(:id)
  #   if @round.over? <-(we'll have to make this method)
  #     redirect to users restuls
  #   else
  #     @card = @round.next_card <-(we'll have to make this method)
  #     redirect to 'round/:id'
  #  TEXT