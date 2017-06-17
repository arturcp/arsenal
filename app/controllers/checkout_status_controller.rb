class CheckoutStatusController < ApplicationController
  layout 'landing'

  def index
    reset_session
  end
end
