class ItemsController < ApplicationController
  before_action :set_campaign, only: :create

  def create
    Item.create!(valid_params)
    redirect_to @campaign, notice: 'Campaign was successfully created.'
  end

  private

  def valid_params
    params.require(:item).permit(:campaign_id, :name, :image_url)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
