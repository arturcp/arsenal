class AddVideoUrlToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :video_url, :string
  end
end
