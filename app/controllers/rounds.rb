### CREATE NEW ROUND

post '/decks/:deck_id/round/create' do

  unless session[:user_id] 
    redirect '/'
  end

  @user = User.find(session[:id])
  @deck = Deck.find(params[:deck_id])
  @round = @user.rounds.create(deck: @deck )

  redirect "/decks/#{@deck.id}/rounds/#{@round.id}/play"
end

## ROUND IN PLAY

get '/rounds/:round_id/play' do

  @round = Round.find(session[:round_id])

  @card = @round.next_card
  session[:guess_id] = @guess.id

  erb :'/decks/rounds/play'
end

## USER'S MOST RECENT ROUND RESULTS

get '/decks/rounds/results' do

  @round = Round.find(session[:round_id])
  @guesses = Guess.where(round_id: @round.id)
  @correct_guesses = @guesses.select {|guess| guess.correct? }

  erb :'/decks/rounds/results'
end

