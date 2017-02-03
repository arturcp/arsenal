class CheckoutsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # order = Order.find(params[:id])

    payment = PagSeguro::PaymentRequest.new

    payment.credentials = PagSeguro::AccountCredentials.new('artur.prado@gmail.com', '4FB6532320FC4176B4D97453B54C1F09')

    payment.reference = 'REF1234'
    payment.notification_url = 'https://youse-remembrall.herokuapp.com'
    payment.redirect_url = 'https://youse-remembrall.herokuapp.com'

    # order.products.each do |product|
      # payment.items << {
      #   id: 1,
      #   description: 'dscription',
      #   amount: 0.01,
      #   weight: 2
      # }
    # end

    payment.items << {
      id: 1,
      description: 'description',
      amount: 5.0,
      weight: 2
    }

    payment.sender = {
      name: "John Joe",
      email: "teste@teste.com.br",
      document: { type: "CPF", value: "21639716866" },
      phone: {
        area_code: 11,
        number: "12345678"
      }
    }

    # payment.extra_params << { paramName: 'paramValue' }
    # payment.extra_params << { senderBirthDate: '07/05/1981' }
    # payment.extra_params << { extraAmount: '-15.00' }

    response = payment.register

    if response.errors.any?
      raise response.errors.join("\n")
    else
      redirect_to response.url
    end
  end
end
