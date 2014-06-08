class Comment < ActiveRecord::Base

  has_many :votes, as: :votable
  
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :body, :presence => true
  validates :user, :presence => true
  validates :commentable, :presence => true
end
