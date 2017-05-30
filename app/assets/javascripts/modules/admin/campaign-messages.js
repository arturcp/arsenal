define('campaign-messages', [], function() {
  function CampaignMessages() {
    this.badges = $('.centralized-badge');
    this.modal = $('#campaign-messages-modal');

    this._bindEvents();
  };

  var fn = CampaignMessages.prototype;

  fn._bindEvents = function() {
    this.badges.off('click').on('click', $.proxy(this._openModal, this));

    var approveButtons = $('[data-approve-message]'),
        rejectButtons = $('[data-reject-message]');

    approveButtons.off('click').on('click', $.proxy(this._approveMessage, this));
    rejectButtons.off('click').on('click', $.proxy(this._rejectMessage, this));
  };

  fn._openModal = function(event) {
    var element = $(event.currentTarget),
        url = element.data('messages-url'),
        self = this;

    $.ajax({
      url: url
    }).done(function(content) {
      $('[data-messages-tabs]').html(content);
      self.modal.modal().modal('open');

      var tabs = $('#campaign-messages-modal .tabs'),
          firstTab = $('#campaign-messages-modal .tabs a:first');

      tabs.tabs();
      firstTab.trigger('click');

      self._bindEvents();
    });
  };

  fn._changeMessageStatus = function(event, status) {
    var element = $(event.currentTarget),
        messageId = element.data(status + '-message');
        row = element.parents('tr:first');

    new RowTransferer(row).transferTo(status);

    this._bindEvents();
  };

  fn._approveMessage = function(event) {
    this._changeMessageStatus(event, 'approve');
  };

  fn._rejectMessage = function(event) {
    this._changeMessageStatus(event, 'reject');
  };

  var RowTransferer = function(row, status) {
    this.row = row;
    this.hideClass = 'hide';

    this.transferTo = function(status) {
      this.status = status;
      this.container = $('[data-' + status + '-container]')

      var newRow = this._transferRow();
      this._toggleButtons(newRow);
      this.row.hide('slow', function() { $(this).remove() });
    };

    this._toggleButtons = function(row) {
      triggeredButton = row.find('.' + this.status + '-message');

      row.find('.hide').removeClass(this.hideClass);
      triggeredButton.addClass(this.hideClass);
    };

    this._transferRow = function() {
      var newRow = $(this.row.prop('outerHTML'));
      this.container.find('table tbody').prepend(newRow);

      return newRow;
    };
  };

  return CampaignMessages;
});
