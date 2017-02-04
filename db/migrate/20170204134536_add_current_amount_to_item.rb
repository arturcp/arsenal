class AddCurrentAmountToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :current_amount, :integer, default: 0
  end
end
