page.at('admin/campaigns#index admin/campaigns#edit', function() {
  var Calendar = require('calendar');

  new Calendar('.datepicker');
});

page.at('admin/campaigns#show', function() {
  var Orders = require('orders'),
      CampaignNews = require('campaign-news');

  new Orders();
  new CampaignNews();
});

page.at('campaigns/landings#show', function() {
  var CampaignNews = require('campaign-news');

  new CampaignNews().expandOnClick();
});
