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

  def leaderboard(num = 3)
    @leaderboard = []
    leaders = get_leaders
    num.times do
      @leaderboard << leaders.shift
    end
    @leaderboard
  end

  def get_leaders
    get_results.sort! (|k| k([:guesses].where(correct: true).length.to_f/[:guesses].length))
  end

  def get_results(user = nil)
    results = []
    if user
      results << find_results(user)
    end

      end
    else
      User.all
    end
  end

  def find_results(user)
    user.rounds.map { |round| {round: round.id, user: round.user.name, deck: round.deck.name, guesses: round.guesses} }




  end


end
