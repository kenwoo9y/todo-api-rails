class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 30
      t.string :email, limit: 80
      t.string :first_name, limit: 40
      t.string :last_name, limit: 40

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
