###  SIMPLE USER TEST ROUND CREATION

eddie = User.create(name: "Eddie", email: "ehk@gmail.com", password: "123" )
avi = User.create(name: 'Avi', email: "avi@avi.avi", password: "avi")


math_deck = Deck.create(name: "Math")
animal_deck = Deck.create(name: "Animals")
bond_deck = Deck.create(name: "James Bond")

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

bond_array = [
  {question: "Who was this golden gun-bearing villain?", answer: "Francisco Scaramanga"},
  {question: "What Bond villain concealed a deadly weapon in her shoes?", answer: "Rosa Klebb"},
  {question: "What is the title of the first James Bond film?", answer: "Dr No"},
  {question: "In which Bond movie does the villain Kanaga appear?", answer: "Live and Let Die"},
  {question: "In 007, the double 0 means Bond has a license to what?", answer: "kill"},
  {question: "What is the first James Bond movie to be filmed in Russia?", answer: "Goldeneye"},
  {question: "At the beginning of Quantum of Solace, who does Bond have trapped in the boot of his car?", answer: "mr white"},
  {question: "Which was Sean Connery's final ‘OFFICIAL’ appearance as Bond?", answer: "Diamonds Are Forever"},
  {question: "The following quote appears in which Bond movie: 'Choose your next wittisism carefully Mr. Bond, it may be your last!'", answer: "Goldfinger"},
  {question: "What is this villain's last name? ", answer: "Blofeld"},
  {question: "Major Boothroyd is better known as who?", answer: "Q"},
  {question: "What author created James Bond?", answer: "Ian Fleming"},
  {question: "Who was this James Bond actor?", answer: "Roger Moore"},
  {question: "In which James Bond movie do Bond's arsenal of gadgets include an underwater breathing apparatus, a geiger counter hidden in a watch, and the famous jetpack?", answer: "Thunderball"},
  {question: "Who was this villain who had the famous line 'No Mr Bond, I expect you to die!'", answer: "Goldfinger"},
  {question: "What secret service agency does 007 work for?", answer: "mi6"},
  {question: "In which movie does James Bond become legally married?", answer: "You Only Live Twice"}
]
image_array = [
  "/img/bond_quiz/scar.jpg",
  "/img/bond_quiz/question_1.jpg",
  "/img/bond_quiz/DRNO4.jpg",
  "/img/bond_quiz/kanaga.jpg",
  "/img/bond_quiz/007.jpg",
  "/img/bond_quiz/russia.jpg",
  "/img/bond_quiz/quantum.jpg",
  "/img/bond_quiz/connery.jpg",
  "/img/bond_quiz/goldfinger.jpg",
  "/img/bond_quiz/ernst.jpg",
  "/img/bond_quiz/major.png",
  "/img/bond_quiz/author.jpg",
  "/img/bond_quiz/moore.gif",
  "/img/bond_quiz/gadgets.jpg",
  "/img/bond_quiz/gf_thumb.jpg"
]

bond_array.each_with_index do |row, index|
  card = Card.create(row)
  bond_deck.cards << card
  if image_array[index]
    card.image = Image.create(url: image_array[index])
  end
end




# deck1.cards << card1
# deck1.cards << card2

# round1.cards # => 2


# deck1.cards # => card1

# card1.guesses.create(user_input: 'no')
# card1.guesses.create(user_input: 'yes')

# c1guesses = card1.guesses # =>


