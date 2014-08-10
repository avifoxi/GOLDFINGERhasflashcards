class Guess < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_input, presence: true

  belongs_to :round
  belongs_to :card

  after_initialize do 
  	self.correct?
  end

  def correct?
  	unless self.correct == nil
  		return nil
  	end
  	card = self.card
  	if card.answer.downcase == self.user_input.downcase
  		self.correct = true
  		self.save
    else 
    	self.correct = false
    	self.save
    end
  end

end
