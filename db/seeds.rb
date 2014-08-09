###  SIMPLE USER TEST ROUND CREATION

eddie = User.create(name: "Eddie", email: "ehk@gmail.com", password: "123" )
avi = User.create(name: 'Avi', email: "avi@avi.avi", password: "avi")


math_deck = Deck.create(name: "Math")
animal_deck = Deck.create(name: "Animals")

eddie_round_1 = eddie.rounds.create
#round1 = fishie.rounds.create(deck: deck1) -- in place of line10 when paired with line 7
# eddie_round_1.rounds << round1
eddie_round_1.deck = animal_deck
eddie_round_1.save

avi_round_1 = avi.rounds.create
avi_round_1.deck = math_deck
avi_round_1.save


5.times do |i|
  math_deck.cards << Card.create(question: "what is this number (answer: #{i})?", answer: i.to_s)
end

animals_array = [
  {question: "What food makes up nearly all of Giant Panda's diet?", answer: "Bamboo"},
  {question: "What is the largest type of 'big cat' in the world?",answer: "Tiger"},
  {question: "What are female elephants called?", answer: "Cows"},
  {question: "Bees are found on every continent of earth except for one, which is it?", answer: "Antarctica"},
  {question: "What is the fastest land animal in the world?", answer: "Cheetah"},
  {question: "How many pairs of wings does a bee have?", answer: "2"},
  {question: "What type of animal is the largest primate in the world?", answer: "Gorilla"},
  {question: "Group of lions are known as what?", answer: "Pride"},
  {question: "What is the name of an adult female horse?", answer: "Mare"},
  {question: "What is the tallest animal in the world?", answer: "Giraffe"},
  {question: "What are baby goats called?", answer: "Kids"},
  {question: "What are baby gorillas called?", answer: "Infant"},
  {question: "What animal, besides snakes, can go for two years without food?", answer: "Crocodile"},
  {question: "What does a Woolly Bear Caterpillar turn into?", answer: "Tiger Moth"},
  {question: "What animal can breathe through their butts?", answer: "Turtle"},
  {question: "What animal has 32 muscles in each ear?", answer: "Cat"},
  {question: "What animal exclusively eats only eucalyptus leaves?", answer: "Koala"},
  {question: "What animal's teeth never stop growing?", answer: "Beaver"},
  {question: "There are one million ____ for every person in the world.", answer: "Ants"},
  {question: "The only dog that doesn't have a pink tongue is the", answer: "Chow"}
]

animals_array.each do |row|
  animal_deck.cards << Card.create(row)
end


# dinosaur_deck = Deck.create(name: "Dinosaurs")


# deck1.cards << card1
# deck1.cards << card2

# round1.cards # => 2


# deck1.cards # => card1

# card1.guesses.create(user_input: 'no')
# card1.guesses.create(user_input: 'yes')

# c1guesses = card1.guesses # =>


