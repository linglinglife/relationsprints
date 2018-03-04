class CreateWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workspaces do |t|
      t.text :name
      t.text :access_token

      t.timestamps
    end
  end
end
