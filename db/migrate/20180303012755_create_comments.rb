class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :title
      t.text :description
      t.integer :card_id
      t.integer :user_id

      t.timestamps
    end
  end
end
