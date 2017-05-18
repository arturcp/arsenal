module CampaignsHelper
  def html_description(campaign)
    campaign.description.sub("\n", '<br><br>').html_safe
  end

  def items_for_select(campaign)
    campaign.items.map do |item|
      [item.name, item.id]
    end
  end
end
