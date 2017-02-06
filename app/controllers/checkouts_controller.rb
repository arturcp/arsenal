class CheckoutsController < ApplicationController
  def create
    cart = ShoppingCart.new(session[:cart])
    payment = PagSeguro::PaymentRequest.new
    payment.credentials = PagSeguro::AccountCredentials.new(ENV.fetch('PAGSEGURO_EMAIL'), ENV.fetch('PAGSEGURO_TOKEN'))

    payment.reference = SecureRandom.uuid
    payment.notification_url = 'https://youse-remembrall.herokuapp.com'
    payment.redirect_url = 'https://youse-remembrall.herokuapp.com'

    cart.items.each do |item|
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
      redirect_to response.url
    end
  end
end
