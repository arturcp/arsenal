define('campaign-news', [], function() {
  function CampaignNews() {
    this.expandButton = $('.campaign-news-expand-button a');
  };

  var fn = CampaignNews.prototype;

  fn.expandOnClick = function() {
    this.expandButton.on('click', this._showCampaignNews);
  };

  fn._showCampaignNews = function() {
    $('.campaign-diary .hidden').removeClass('hidden');
    $(this).parent().remove();
  };

  return CampaignNews;
});
