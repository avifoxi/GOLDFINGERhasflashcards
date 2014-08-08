class Guess < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_input, presence: true

  belongs_to :round
  belongs_to :card
end
