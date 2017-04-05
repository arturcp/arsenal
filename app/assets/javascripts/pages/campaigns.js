page.at('campaigns#index campaigns#edit', function() {
  var Calendar = require('calendar');

  new Calendar('.datepicker');
});
