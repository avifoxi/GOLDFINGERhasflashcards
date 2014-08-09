class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  def over?
    @card_list ||= self.deck.cards.map { |card| card.id }
    return true if @card_list.empty?
    @next_card = Card. findby id = card_list.sample
    @card_list.delete(@next_card)

    # true unless @played_cards
  end

# cards = self.deck.cards
# when guess is made, remove card with card_id from cards

  def played_card
    Card.find(id: Guess.last.card_id)
  end

  def next_card
    self.deck.cards.sample
  end

end