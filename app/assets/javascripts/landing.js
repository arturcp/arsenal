// This is a manifest file that'll be compiled into landing.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ujs
//= require materialize
//= require waypoints/lib/jquery.waypoints.js
//= require magnific-popup
//= require goalProgress.js/goalProgress
//= require page
//= require almond
//= require_tree ./pages
//= require_tree ./modules/landing

$(document).on('ready page:load', function() {
  page.dispatch();
});
