json.extract! campaign, :id, :name, :description, :start_date, :end_date, :campaign_type, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
