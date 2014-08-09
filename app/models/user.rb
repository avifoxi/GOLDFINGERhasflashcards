class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds

  ## BUG BUG  - user should have many decks through rounds

  def self.leaderboard
    @leaderboard = []
    User.all.each do |user|
      user.rounds.each do |round|
        guesses = Guess.where(round_id: round.id)
        correct_guesses = guesses.select {|guess| guess.correct? }
        @leaderboard << {name: user.name, round: round.id, guesses: guesses, correct_guesses: correct_guesses}
      end
    end
    @leaderboard
  end

  def self.leaders(num = 5)
    leaders = []
    self.leaderboard
    num.times do
      @leaderboard.sort_by! {|key| key[:correct_guess]}.reverse
      leaders << @leaderboard.shift
    end
    leaders
  end


end
