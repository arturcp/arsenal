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
    shopping_cart.build_from_params(params)
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    admin_campaigns_path
  end
end
