###  SIMPLE USER TEST ROUND CREATION 

fishie = User.create(name: 'fishie')

deck1 = Deck.create(name: 'fish qs')

round1 = fishie.round.create

round1.decks << deck1

card1 = Card.create(question: 'are you a fish', answer: 'yes')

card2 = Card.create(question: 'are you a dog', answer: 'no')

deck.cards << card1 
deck.cards << card2 

round1.cards # => 2 


deck.cards # => card1

card1.guess.create(input: 'no')
card1.guess.create(input: 'yes')

c1guesses = card1.guesses # =>

fishie.rounds # => 




