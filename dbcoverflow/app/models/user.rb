class User < ActiveRecord::Base
  require 'bcrypt'

  # attr_reader :password_hash
  
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions
  has_many :answers


  validates :username, presence: true, :uniqueness => true, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  # validates :password_hash, :length => { :minimum => 6 }
  validates :email, presence: true, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  def password
    @password ||= Password.new(password_hash)
  end

  # def password=(pass)
  #   # @password_hash = pass
  #   @password = Password.create(pass)
  #   self.password_hash = @password
  # end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end
end

