class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |u|
      u.string :body, :required => true
      u.belongs_to :user, :required => true
      u.timestamps
    end
  end
end
