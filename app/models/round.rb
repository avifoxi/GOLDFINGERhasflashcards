    class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  def over?
    deck_cards ||= self.deck.cards.map { |card| card.id }
    played_cards = self.guesses.map { |guess| guess.card_id }
    @card_list = deck_cards - played_cards
    return true if @card_list.empty?
  end

  def next_card
    Card.find(@card_list.shuffle!.pop) unless over?
  end

end
