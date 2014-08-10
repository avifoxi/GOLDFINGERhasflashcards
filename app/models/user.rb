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

end
