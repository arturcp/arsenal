class AddClosingTextToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :closing_text, :string, default: ''
  end
end
