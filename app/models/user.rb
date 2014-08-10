require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :played_decks, through: :rounds, source: :deck
  has_many :authored_decks, class_name: 'Deck', foreign_key: :author_id

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

    # def leaderboard(num = 3)
  #   @leaderboard = []
  #   leaders = get_leaders
  #   num.times do
  #     @leaderboard << leaders.shift
  #   end
  #   @leaderboard
  # end

  # def get_leaders
  #   get_results.sort! (|k| k([:guesses].where(correct: true).length.to_f/[:guesses].length))
  # end

  def get_results
    find_results
  end

  def self.get_results
    User.all.map { |user| user.find_results }
  end

  def find_results
    self.rounds.map { |round| {round: round.id, user: round.user.name, deck: round.deck.name, guesses: round.guesses} }
  end

end
