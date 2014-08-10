class Deck < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true

  has_many :cards
  has_many :rounds
  has_many :guesses, through: :cards
  belongs_to :author, class_name: 'User'
end
