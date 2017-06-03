module Admin
  class ItemsController < AdminController
    before_action :set_campaign, only: [:create, :index]

    def create
      Item.create!(valid_params)
      self.tab_after_redirect = Admin::Tabs::ITEMS_LIST_TAB

      redirect_to [:admin, @campaign], notice: 'Item criado com sucesso.'
    end

    def destroy
      item = Item.find(params[:id])

      if item
        item.destroy
        self.tab_after_redirect = Admin::Tabs::ITEMS_LIST_TAB
      end

      redirect_to [:admin, item.campaign], notice: 'Item removido com sucesso.'
    end

    private

    def valid_params
      params.require(:item).permit(:campaign_id, :name, :image_url, :price, :target)
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
  end
end
