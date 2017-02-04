module CampaignsHelper
  def html_description(campaign)
    campaign.description.sub("\n", '<br><br>').html_safe
  end
end
