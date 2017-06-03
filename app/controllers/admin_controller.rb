class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :activate_tab
  before_action :authenticate_user!

  layout 'admin'

  protected

  def tab_after_redirect=(tab)
    session[:tab_to_open] = tab
  end

  def tab_after_render=(tab)
    @active_tab = tab
  end

  private

  def activate_tab
    @active_tab = session[:tab_to_open]
    session[:tab_to_open] = nil
  end
end
