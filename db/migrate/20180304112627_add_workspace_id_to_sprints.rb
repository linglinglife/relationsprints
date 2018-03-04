class AddWorkspaceIdToSprints < ActiveRecord::Migration[5.1]
  def change
    add_column :sprints, :workspace_id, :integer
  end
end
