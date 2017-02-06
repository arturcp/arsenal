class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def shopping_cart
    @cart ||= begin
      session[:cart] = {} unless session[:cart]
      ShoppingCart.new(session)
    end
  end
end
