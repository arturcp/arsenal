class ShoppingCartController < ApplicationController
  include ApplicationHelper

  before_action :set_item_id, only: :create
  before_action :save_cart_state, only: :destroy

  def index
    @campaign = Campaign.last
    @shopping_cart = shopping_cart

    render :index, layout: 'landing'
  end

  def create
    shopping_cart.add(@item_id)

    redirect_to shopping_cart_index_path
  end

  def destroy
    shopping_cart.remove(params[:id])

    redirect_to shopping_cart_index_path
  end

  private

  def valid_params
    params.require(:item).permit(:id)
  end

  def set_item_id
    @item_id = valid_params[:id].to_i
  end
end