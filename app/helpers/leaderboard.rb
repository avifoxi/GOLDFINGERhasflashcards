module LeaderBoard

  def self.leaders(num = 3)
    sort_results[0..num - 1]
  end

  def self.sort_results
    get_all_results.sort! {|a, b| b.score <=> a.score }
  end

  def self.get_all_results
    User.all.map { |user| get_user_results(user) }.flatten
  end

  def self.get_user_results(user)
    user.rounds.map { |round| Result.new(round) }
  end


  class Result
    attr_accessor :round, :name, :deck, :guesses

    def initialize(round)
      @round = round.id
      @name = round.user.name
      @deck = round.deck.name
      @guesses = round.guesses
    end

    def score
      (guesses.where(correct: true).length * 50 - guesses.where(correct: false).length * 75)
    end

  end

end