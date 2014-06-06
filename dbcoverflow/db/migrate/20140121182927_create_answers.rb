class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |u|
      u.belongs_to :question
      u.belongs_to :user
      u.string :body

      u.timestamps
    end
  end
end
