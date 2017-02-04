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
});
