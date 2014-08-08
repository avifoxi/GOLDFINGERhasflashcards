###  SIMPLE USER TEST ROUND CREATION

eddie = User.create(name: "Eddie", email: "ehk@gmail.com", password: "123" )
avi = User.create(name: 'Avi', email: "avi@avi.avi", password: "avi")

math_deck = Deck.create(name: 'Math')
animal_deck = Deck.create(name: 'Animals')

eddie_round_1 = eddie.rounds.create
#round1 = fishie.rounds.create(deck: deck1) -- in place of line10 when paired with line 7
# eddie_round_1.rounds << round1
eddie_round_1.decks << animal_deck

5.times do |i|
  math_deck.cards << Card.create(question: 'what is this number?', answer: i.to_s)
end

animals_array = %w(Cheetah Tiger Lion Panther Jaguar)

animals_array.each do |row|
  animal_deck.cards << Card.create(question: 'what animal is this?', answer: row )
end
# math_card1 = Card.create(question: 'are you a fish', answer: 'yes')
# math_card2 = Card.create(question: 'are you a dog', answer: 'no')
# math_card3 = Card.create(question: 'are you a fish', answer: 'yes')
# math_card4 = Card.create(question: 'are you a dog', answer: 'no')
# math_card5 = Card.create(question: 'are you a fish', answer: 'yes')

# card = Card.create(question: 'are you a dog', answer: 'no')
# card1 = Card.create(question: 'are you a fish', answer: 'yes')
# card2 = Card.create(question: 'are you a dog', answer: 'no')
# card1 = Card.create(question: 'are you a fish', answer: 'yes')
# card2 = Card.create(question: 'are you a dog', answer: 'no')


# deck1.cards << card1
# deck1.cards << card2

# round1.cards # => 2


# deck1.cards # => card1

# card1.guesses.create(user_input: 'no')
# card1.guesses.create(user_input: 'yes')

# c1guesses = card1.guesses # =>

# fishie.rounds # =>




