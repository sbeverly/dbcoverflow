class User < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions
  has_many :answers
  

  validates :username, presence: true, :uniqueness => true, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :email, presence: true, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay
  #password_confirmation possibly NEEDED ------

  has_secure_password

end

