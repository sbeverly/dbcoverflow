class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |u|
      u.string :body
      u.belongs_to :user
      u.belongs_to :commentable, polymorphic: true
      u.timestamps
    end
  end
end
