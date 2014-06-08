class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |u|
      u.integer :score, default: 0
      u.references :votable, polymorphic: true
      u.timestamps
    end 
  end
end
