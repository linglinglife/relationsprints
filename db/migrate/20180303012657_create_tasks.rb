class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :todo
      t.integer :user_id
      t.integer :card_id

      t.timestamps
    end
  end
end
