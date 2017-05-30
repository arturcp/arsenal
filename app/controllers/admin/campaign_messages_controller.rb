module Admin
  class CampaignMessagesController < AdminController
    def show
      campaign = Campaign.find(params[:id])

      pending_messages = campaign.messages_by_status(status: nil)
      approved_messages = campaign.messages_by_status(status: 1)
      rejected_messages = campaign.messages_by_status(status: 0)

      render text: render_to_string(
        template: 'admin/campaigns/_campaign_messages_tabs',
        locals: {
          pending_messages: pending_messages,
          approved_messages: approved_messages,
          rejected_messages: rejected_messages
        },
        layout: false
      )
    end

    def update
      if campaign_message.campaign.id == params[:id].to_i
        campaign_message.update(status: params[:status])
      end

      head :ok
    end

    private

    def campaign_message
      @campaign_message ||= CampaignMessage.find(params[:message_id].to_i)
    end
  end
end
