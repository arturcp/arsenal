module Admin
  class CampaignsController < AdminController
    before_action :set_campaign, only: [:show, :edit, :update, :destroy]
    before_action :set_current_menu

    def index
      @campaigns = Campaign.all
      @campaign = Campaign.new
    end

    def show
    end

    def new
      @campaign = Campaign.new
    end

    def edit
    end

    def create
      @campaign = Campaign.new(campaign_params)

      if @campaign.save
        redirect_to [:admin, @campaign], notice: 'Campanha criada com sucesso.'
      else
        @campaigns = Campaign.all

        self.tab_after_render = Admin::Tabs::NEW_CAMPAIGN_TAB
        render :index
      end
    end

    def update
      if @campaign.update(campaign_params)
        redirect_to [:admin, @campaign], notice: 'Campanha atualizada com sucesso.'
      else
        self.tab_after_render = Admin::Tabs::NEW_CAMPAIGN_TAB
        render :edit
      end
    end

    def destroy
      @campaign.destroy
      redirect_to admin_campaigns_url, notice: 'Campanha removida com sucesso.'
    end

    private

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def set_current_menu
      @current_menu = 'campaigns'
    end

    def campaign_params
      params[:campaign].merge!(start_date: params[:start_date], end_date: params[:end_date])

      params.require(:campaign).permit(:name, :description, :start_date, :end_date,
        :campaign_type, :title, :subtitle, :main_image_url, :video_url, :closing_text,
        :display
      )
    end
  end
end
