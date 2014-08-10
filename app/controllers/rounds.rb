### CREATE NEW ROUND

post '/decks/round/create' do

  unless session[:user_id] 
    redirect '/'
  end

  p params

  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:deck_id])
  @round = @user.rounds.create(deck: @deck )

  redirect "/rounds/#{@round.id}/play"
end

## ROUND IN PLAY

get '/rounds/:round_id/play' do
  @round = Round.find(params[:round_id])
  
  if @round.over?
    session[:result].clear
    redirect "/rounds/#{@round.id}/results"
  end

  @card = @round.next_card

  erb :'/decks/rounds/play'
end

## USER'S MOST RECENT ROUND RESULTS

get '/rounds/:round_id/results' do

  @round = Round.find(params[:round_id])
  
  @guesses = @round.guesses
  
  @correct_guesses = @guesses.select {|guess| guess.correct? == true }

  erb :'/decks/rounds/results'
end

