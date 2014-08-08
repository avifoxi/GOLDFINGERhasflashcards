get 'round/:round_id' do
  puts <<-TEXT
    display the page youre going to play on
    @round = Round.find(:id)
    if @round.over? <-(we'll have to make this method)
      redirect to users restuls
    else
    	@card = @round.next_card <-(we'll have to make this method)
      redirect to 'round/:id'
   TEXT
end
