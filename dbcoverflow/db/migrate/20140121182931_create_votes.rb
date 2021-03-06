class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |u|
      u.integer :score
      u.references :votable, polymorphic: true
      u.belongs_to :user, :required => true
      u.timestamps
    end
  end
end
