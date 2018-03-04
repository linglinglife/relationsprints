class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.boolean :status
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
