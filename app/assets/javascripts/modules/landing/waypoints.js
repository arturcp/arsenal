$(document).ready(function() {
  var waypointsOptions = {
    offset: 'bottom-in-view'
  };

  var trigger = $('#map-trigger');

  trigger.waypoint(function(direction) {
    var elem = $('#maps-visibility'),
        src = elem.data('src'),
        loaded = elem.data('loaded');

    if (!loaded) {
      $('#google-maps').attr('src', src);
      elem.attr('data-loaded', true);
    }
  }, waypointsOptions);

  var campaignBlockContainer = $('#campaign-block-container');

  campaignBlockContainer.waypoint(function(direction) {
    var progressBar = campaignBlockContainer.find('#goal-progress'),
        loaded = progressBar.data('loaded');

    if (!loaded) {
      $('#goal-progress').goalProgress({
        goalAmount: progressBar.data('target'),
        currentAmount: progressBar.data('current-amount'),
        textBefore: 'R$ ',
        textAfter: ''
      });
      progressBar.attr('data-loaded', true);
    }
  }, waypointsOptions);
});
