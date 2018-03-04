class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :sentiment
      t.text :incident
      t.text :feeling
      t.text :expectation
      t.integer :importance
      t.integer :user_id
      t.integer :sprint_id

      t.timestamps
    end
  end
end
