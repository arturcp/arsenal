class ShoppingCartController < ApplicationController
  include ApplicationHelper

  before_action :set_campaign
  before_action :set_item_id, only: :create
  before_action :save_cart_state, only: :destroy

  def index
    @shopping_cart = shopping_cart

    render :index, layout: 'landing'
  end

  def create
    shopping_cart.add(@item_id)

    redirect_to shopping_cart_index_path(@campaign)
  end

  def destroy
    shopping_cart.remove(params[:id])

    redirect_to shopping_cart_index_path(@campaign)
  end

  private

  def safe_params
    params.permit(:campaign_id)
  end

  def item_params
    params.require(:item).permit(:id)
  end

  def set_item_id
    @item_id = item_params[:id].to_i
  end

  def set_campaign
    @campaign = Campaign.find(safe_params[:campaign_id])
  end
end
