class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |u|
      u.string :body
      u.belongs_to :user
      u.timestamps
    end
  end
end
