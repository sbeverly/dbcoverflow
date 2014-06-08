class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :username, :required => true
      u.string :email, :required => true
      u.string :password_digest, :required => true

      u.timestamps
    end
  end
end
