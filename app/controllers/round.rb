get '/decks/rounds/play' do
  # puts <<-TEXT
  #   display the page youre going to play on
  #   @round = Round.find(:id)
  #   if @round.over? <-(we'll have to make this method)
  #     redirect to users restuls
  #   else
  #   	@card = @round.next_card <-(we'll have to make this method)
  #     redirect to 'round/:id'
  #  TEXT
  puts "hi"
  p params
  @round = Round.find(session[:round_id])
  @user = @round.user
  @deck = @round.deck
  @card = @round.next_card



  erb :'/decks/rounds/play'
end
