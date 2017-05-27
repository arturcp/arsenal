module CampaignsHelper
  def html_description(campaign)
    text_to_html(campaign.description)
  end

  def items_for_select(campaign)
    campaign.items.map do |item|
      [item.name, item.id]
    end
  end

  def text_to_html(text)
    text.sub("\n", '<br><br>').html_safe
  end
end
