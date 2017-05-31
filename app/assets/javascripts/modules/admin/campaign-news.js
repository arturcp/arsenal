define('campaign-news', [], function() {
  function CampaignNews() {
    this.deleteButtons = $('[data-delete-campaign-news]');

    this._bindEvents();
  };

  var fn = CampaignNews.prototype;

  fn._bindEvents = function() {
    this.deleteButtons.on('click', this._deleteCampaignNews);
  };

  fn._deleteCampaignNews = function() {
    var url = $(this).data('delete-campaign-news'),
        container = $(this).parents('div[data-campaign-news]');

    $.ajax({
      type: "DELETE",
      url: url
    })
    .done(function() {
      container.remove();
    });
  };

  return CampaignNews;
});
