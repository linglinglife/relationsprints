class CreateUserWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :user_workspaces do |t|

      t.timestamps
    end
  end
end
