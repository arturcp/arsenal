class CheckoutsController < ApplicationController
  before_action :save_cart_state, only: :create
  after_action :clear_shopping_cart, only: :show

  def show
    @order = Order.find(params[:id])
    @campaign = Campaign.find(shopping_cart.items.first.campaign_id)

    render :show, layout: 'landing'
  end

  def create
    payment = PagSeguro::PaymentRequest.new
    payment.credentials = PagSeguro::AccountCredentials.new(ENV.fetch('PAGSEGURO_EMAIL'), ENV.fetch('PAGSEGURO_TOKEN'))

    payment.reference = SecureRandom.uuid

    shopping_cart.items.each do |item|
      payment.items << {
        id: item.id,
        quantity: item.current_amount,
        description: item.name,
        amount: item.price
      }
    end

    response = payment.register

    if response.errors.any?
      raise response.errors.join("\n")
    else
      order = Order.create!(
        reference: payment.reference,
        items: payment.items,
        price: shopping_cart.total
      )

      redirect_to response.url
    end
  end

  private

  def clear_shopping_cart
    reset_session
  end
end
