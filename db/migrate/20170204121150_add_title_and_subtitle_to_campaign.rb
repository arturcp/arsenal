class AddTitleAndSubtitleToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :title, :string
    add_column :campaigns, :subtitle, :string
  end
end
