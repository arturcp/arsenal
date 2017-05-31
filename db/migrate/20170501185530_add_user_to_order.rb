class AddUserToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :email, :string
    add_column :orders, :comments, :string
  end
end
