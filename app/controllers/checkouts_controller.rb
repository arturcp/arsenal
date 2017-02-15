class CheckoutsController < ApplicationController
  before_action :save_cart_state, only: :create

  def create
    payment = PagSeguro::PaymentRequest.new
    payment.credentials = PagSeguro::AccountCredentials.new(ENV.fetch('PAGSEGURO_EMAIL'), ENV.fetch('PAGSEGURO_TOKEN'))

    payment.reference = SecureRandom.uuid
    payment.notification_url = 'https://youse-remembrall.herokuapp.com'
    payment.redirect_url = 'https://youse-remembrall.herokuapp.com'

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
        items: payment.items
      )

      reset_session
      redirect_to response.url
    end
  end
end
