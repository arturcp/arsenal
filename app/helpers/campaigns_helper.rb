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

  def collaborators_authors(messages)
    messages.pluck(:author).uniq.sort.join('<br>').html_safe
  end

  def valid_collaborators?(campaign)
    campaign.campaign_messages.select { |message| message.author.present? }.count.positive?
  end
end
