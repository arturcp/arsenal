module Campaigns
  class LandingsController < ApplicationController
    layout 'landing'

    def show
      @campaign = Campaign.find(params[:id])
      unless @campaign.display
        redirect_to root_path
      end
    end
  end
end
