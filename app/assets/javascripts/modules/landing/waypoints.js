$(document).ready(function() {
  var waypointsOptions = {
    offset: 'bottom-in-view'
  };

  $('#maps-visibility').waypoint(function(direction) {
    var elem = $('#maps-visibility'),
        src = elem.data('src'),
        loaded = elem.data('loaded');

    if (!loaded) {
      $('#google-maps').attr('src', src);
      elem.attr('data-loaded', true);
    }
  }, waypointsOptions);

  var goal = $('.goal-progress:first')
  goal.waypoint(function(direction) {
    var loaded = goal.data('loaded');

    if (!loaded) {
      $('#goal-progress').goalProgress({
        goalAmount: $(this).data('target'),
        currentAmount: $(this).data('current-amount'),
        textBefore: 'R$ ',
        textAfter: ' arrecadados'
      });
      goal.attr('data-loaded', true);
    }
  }, waypointsOptions);
});
