###  SIMPLE USER TEST ROUND CREATION

fishie = User.create(name: 'fishie', email: 'feesh@fish.com', password: 'abc123')

deck1 = Deck.create(name: 'fish qs')

round1 = fishie.rounds.create
#round1 = fishie.rounds.create(deck: deck1) -- in place of line10 when paired with line 7

deck1.rounds << round1
# round1.decks << deck1

card1 = Card.create(question: 'are you a fish', answer: 'yes')

card2 = Card.create(question: 'are you a dog', answer: 'no')

deck1.cards << card1
deck1.cards << card2

round1.cards # => 2


deck1.cards # => card1

card1.guesses.create(user_input: 'no')
card1.guesses.create(user_input: 'yes')

c1guesses = card1.guesses # =>

fishie.rounds # =>

try something like this: 
def over? 
total_chances
self.guesses.each do |guess|
guess.card_id




