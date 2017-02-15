class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def shopping_cart
    @cart ||= begin
      session[:cart] = {} unless session[:cart]
      ShoppingCart.new(session)
    end
  end

  def save_cart_state
    # TODO: save cart data on the session
  end
end
