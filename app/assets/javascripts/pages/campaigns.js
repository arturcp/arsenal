page.at('admin/campaigns#index admin/campaigns#edit', function() {
  var Calendar = require('calendar');

  new Calendar('.datepicker');
});

page.at('admin/campaigns#show', function() {
  var Orders = require('orders');

  new Orders();
});
