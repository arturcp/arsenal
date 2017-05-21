class CreateCampaignNews < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_news do |t|
      t.integer :campaign_id
      t.string :text
      t.string :link
      t.string :link_text

      t.timestamps
    end
  end
end
