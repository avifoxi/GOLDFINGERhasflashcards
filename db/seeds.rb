###  SIMPLE USER TEST ROUND CREATION

eddie = User.create(name: "Eddie", email: "ehk@gmail.com", password: "123" )
avi = User.create(name: 'Avi', email: "avi@avi.avi", password: "avi")


math_deck = Deck.create(name: "Math")
animal_deck = Deck.create(name: "Animals")

eddie_round_1 = eddie.rounds.create
#round1 = fishie.rounds.create(deck: deck1) -- in place of line10 when paired with line 7
# eddie_round_1.rounds << round1
eddie_round_1.deck = animal_deck

avi_round_1 = avi.rounds.create
avi_round_1.deck = math_deck

5.times do |i|
  math_deck.cards << Card.create(question: "what is this number (answer: #{i})?", answer: i.to_s)
end

animals_array = %w(Cheetah Tiger Lion Panther Jaguar)

animals_array.each do |row|
  animal_deck.cards << Card.create(question: "what animal is this animal (answer: #{row})?", answer: row )
end





# deck1.cards << card1
# deck1.cards << card2

# round1.cards # => 2


# deck1.cards # => card1

# card1.guesses.create(user_input: 'no')
# card1.guesses.create(user_input: 'yes')

# c1guesses = card1.guesses # =>


