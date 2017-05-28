class CreateCampaignMessage < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_messages do |t|
      t.integer :campaign_id
      t.string :order_reference
      t.string :name
      t.string :email
      t.string :message
      t.boolean :status

      t.timestamps
    end
  end
end
