class AddCampaignIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :campaign_id, :integer
  end
end
