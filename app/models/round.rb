class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  def over?
    @card_list ||= self.deck.cards.map { |card| card.id }
    return true if @card_list.empty?
  end

  def next_card
    Card.find(@card_list.shuffle!.pop) unless over?
  end

end