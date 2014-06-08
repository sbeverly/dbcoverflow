class Vote < ActiveRecord::Base
	
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :score, :presence => true
  validates :votable, :presence => true
end
