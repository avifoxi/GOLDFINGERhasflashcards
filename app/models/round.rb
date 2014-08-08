class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  def over?
    @played_cards ||= 0
    return true if @played_cards == self.deck.cards.length
    @played_cards += 1
  end


  def next_card
    self.deck.cards.sample
  end

end