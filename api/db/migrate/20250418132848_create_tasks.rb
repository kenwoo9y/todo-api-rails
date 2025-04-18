class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 30
      t.string :description, limit: 255
      t.date :due_date
      t.string :status, limit: 10
      t.references :owner, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
