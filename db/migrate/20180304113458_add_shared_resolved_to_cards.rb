class AddSharedResolvedToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :shared, :boolean
    add_column :cards, :resolved, :boolean
  end
end
