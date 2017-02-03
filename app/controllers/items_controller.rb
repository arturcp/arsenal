class ItemsController < ApplicationController
  before_action :set_campaign, only: :create

  def create
    Item.create!(valid_params)
    redirect_to @campaign, notice: 'Item criado com sucesso.'
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item
    redirect_to item.campaign, notice: 'Item removido com sucesso.'
  end

  private

  def valid_params
    params.require(:item).permit(:campaign_id, :name, :image_url, :price)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
