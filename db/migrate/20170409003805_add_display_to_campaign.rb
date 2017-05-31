class AddDisplayToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :display, :boolean, default: true
  end
end
