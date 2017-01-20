class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :campaign_id
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
