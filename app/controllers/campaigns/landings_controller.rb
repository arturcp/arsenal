module Campaigns
  class LandingsController < ApplicationController
    layout 'landing'

    def show
      @campaign = Campaign.find(params[:id])
      @testimonials = @campaign.messages_by_status(status: 1)

      unless @campaign.display
        redirect_to root_path
      end
    end
  end
end
