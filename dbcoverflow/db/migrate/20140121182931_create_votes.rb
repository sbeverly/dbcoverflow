class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |u|
      u.integer :score, default: 1
      u.references :votable, polymorphic: true
      u.belongs_to :user, :required => true
      u.timestamps
    end 
  end
end
