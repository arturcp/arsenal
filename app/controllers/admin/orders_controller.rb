module Admin
  class OrdersController < ApplicationController
    skip_before_filter :verify_authenticity_token, only: :create
    before_action :authenticate_user!

    def create
      order = Order.create!(
        reference: SecureRandom.uuid,
        items: items,
        price: items.first[:price],
        name: params[:name],
        email: '',
        comments: '',
        campaign_id: params[:campaign_id]
      )

      render text: render_to_string(template: 'admin/campaigns/_order_row', locals: { order: order })
    end

    def destroy
      order = Order.find(params[:id].to_i)
      campaign = order.campaign
      order.destroy

      redirect_to admin_campaign_path(campaign)
    end

    private

    def items
      @items ||= begin
        item = Item.find(params[:item_id])

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
  end
end
