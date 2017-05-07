page.at('campaigns#index campaigns#edit', function() {
  var Calendar = require('calendar');

  new Calendar('.datepicker');
});

page.at('campaigns#show', function() {
  var Orders = require('orders');

  new Orders();
});
