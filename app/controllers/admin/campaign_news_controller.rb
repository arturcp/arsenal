module Admin
  class CampaignNewsController < AdminController
    def create
      campaign.campaign_news.create(campaign_news_params)

      redirect_to [:admin, campaign]
    end

    def destroy
      campaign_news = CampaignNews.find(params[:id])
      campaign_news.destroy

      head :ok
    end

    private

    def campaign
      @campaign ||= Campaign.find(campaign_news_params[:campaign_id].to_i)
    end

    def campaign_news_params
      params.require(:campaign_news).permit(:campaign_id, :text, :link, :link_text)
    end
  end
end
