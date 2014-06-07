class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers

  # Need to confirm with Alex how the session hash is populated so that I can match user id with the 
  def validate_question_ownership(body)  	
  	@question.user_id === session[:id] ? true : false
  end
end
