class ChangeNameFromComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :campaign_messages, :name, :author
  end
end
