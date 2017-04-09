class HomeController < ApplicationController
  def index
    @active_campaigns = Campaign.opened.to_display
    @inactive_campaigns = Campaign.closed.to_display
  end
end
