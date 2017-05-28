class RemoveCommentsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :comments, :string
  end
end
