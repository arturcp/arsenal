module Admin
  class OrdersController < ApplicationController
    skip_before_filter :verify_authenticity_token, only: :create

    def create
      order = Order.create!(
        reference: SecureRandom.uuid,
        items: items,
        price: items.first[:price],
        name: safe_params[:name],
        email: '',
        campaign_id: safe_params[:campaign_id]
      )

      render text: render_to_string(template: 'admin/campaigns/_order_row', locals: { order: order })
    end

    def destroy
      order = Order.find(safe_params[:id])
      campaign = order.campaign
      order.destroy

      redirect_to admin_campaign_path(campaign)
    end

    private

    def items
      @items ||= begin
        item = Item.find(safe_params[:item_id])

        [
          {
            id: item.id,
            quantity: params[:quantity],
            description: item.name,
            amount: item.price,
            price: item.price * params[:quantity].to_f
          }
        ]
      end
    end

    def safe_params
      params.permit(:id, :name, :campaign_id, :item_id)
    end
  end
end
