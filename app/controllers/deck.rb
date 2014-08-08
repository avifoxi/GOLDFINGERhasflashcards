get '/decks' do
  puts "display list of decks, let user pick one"
end

post '/decks/:deck_id/round/create' do
  puts "@round = Round.create(user, deck)"
end
