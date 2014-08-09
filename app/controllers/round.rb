get '/decks/rounds/play' do

  @round = Round.find(session[:round_id])
  @card = @round.next_card
  @guess = Guess.create(round_id: @round.id, card_id: @card.id, user_input: "need input")
  session[:guess_id] = @guess.id

  erb :'/decks/rounds/play'
end

get '/decks/rounds/results' do

  @round = Round.find(session[:round_id])
  @guesses = Guess.where(round_id: @round.id)
  @correct_guesses = @guesses.select {|guess| guess.correct? }
  #methods could be moved to models during refactoring

  erb :'/decks/rounds/results'
end

