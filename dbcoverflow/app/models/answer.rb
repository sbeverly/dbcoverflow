class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :user
  
  has_one :vote, as: :votable
  has_many :comments, as: :commentable

end
