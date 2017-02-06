class ShoppingCartController < ApplicationController
  include ApplicationHelper

  before_action :set_item_id, only: [:create, :destroy]

  def index
    @campaign = Campaign.last
    @shopping_cart = ShoppingCart.new(shopping_cart)
    @shopping_cart.add(Item.first.id, 3)
    @shopping_cart.add(Item.last.id, 1)

    render :index, layout: 'landing'
  end

  def create
    shopping_cart.add(@item_id)

    redirect_to shopping_cart_index_path
  end

  def destroy
    shopping_cart.add(@item_id)

    redirect_to shopping_cart_index_path
  end

  private

  def valid_params
    params.require(:item).permit(:id, :quantity)
  end

  def set_item_id
    @item_id = valid_params[:item][:id]
  end

  def shopping_cart
    session[:cart]
  end
end
