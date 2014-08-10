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

  def self.leaderboard(num = 3)
    User.sort_results[0..num - 1]
  end

  def self.sort_results
    results = User.get_results
    results.each do |round|
      round[:score] = ((round[:guesses].where(correct: true).length * 50) - (round[:guesses].where(correct: false).length * 75))
    end
    results.sort_by! {|key| key[:score]}.reverse!
  end

  def get_results
    self.rounds.map { |round| {round: round.id, user: round.user.name, deck: round.deck.name, guesses: round.guesses} } 
  end

  def self.get_results
    User.all.map { |user| user.get_results }.flatten
  end

end
