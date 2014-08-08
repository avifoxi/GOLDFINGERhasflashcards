class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds
end
