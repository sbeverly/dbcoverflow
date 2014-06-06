class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |u|
      u.belongs_to :question, :required
      u.belongs_to :user, :required => true
      u.string :body, :required => true

      u.timestamps
    end
  end
end
