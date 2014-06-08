class Question < ActiveRecord::Base
  belongs_to :user
  has_one :vote, as: :votable
  has_many :comments, as: :commentable
  has_many :answers

  # Need to confirm with Alex how the session hash is populated so that I can match user id with the 
  def user_owns_question?  	
  	self.user_id === session[:id] ? true : false
  end  
end
