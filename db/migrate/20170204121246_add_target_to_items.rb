class AddTargetToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :target, :integer
  end
end
