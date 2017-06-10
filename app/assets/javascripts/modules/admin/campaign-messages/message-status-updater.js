define('message-status-updater', [], function() {
  function MessageStatusUpdater(row) {
    this.row = row;
    this.hideClass = 'hide';
  };

  var fn = MessageStatusUpdater.prototype;

  fn.approve = function() {
    this._transferTo('approve');
  };

  fn.reject = function() {
    this._transferTo('reject');
  };

  fn._transferTo = function(status) {
    this.status = status;
    this.container = $('[data-' + status + '-container]');

    var newRow = this._transferRow();
    this._toggleButtons(newRow);
    this.row.hide('slow', function() {
      $(this).remove();
    });
  };

  fn._toggleButtons = function(row) {
    triggeredButton = row.find('.' + this.status + '-message');

    row.find('.hide').removeClass(this.hideClass);
    triggeredButton.addClass(this.hideClass);
  };

  fn._transferRow = function() {
    var newRow = $(this.row.prop('outerHTML'));
    this.container.find('table tbody').prepend(newRow);

    return newRow;
  };

  return MessageStatusUpdater;
});
