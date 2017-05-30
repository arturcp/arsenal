define('campaign-messages', ['message-status-updater'], function(MessageStatusUpdater) {
  function CampaignMessages() {
    this.badges = $('.centralized-badge');
    this.modal = $('#campaign-messages-modal');

    this._bindEvents();
  };

  var fn = CampaignMessages.prototype;

  fn._bindEvents = function() {
    this.badges.off('click').on('click', $.proxy(this._initializeModal, this));

    var approveButtons = $('[data-approve-message]'),
        rejectButtons = $('[data-reject-message]');

    approveButtons.off('click').on('click', $.proxy(this._approveMessage, this));
    rejectButtons.off('click').on('click', $.proxy(this._rejectMessage, this));
  };

  fn._initializeModal = function(event) {
    var element = $(event.currentTarget),
        url = element.data('messages-url'),
        self = this;

    $.proxy(this._openModal, this);

    $.ajax({
      url: url
    }).done(function(content) {
      $('[data-messages-tabs]').html(content);
      self._openModal();

      var tabs = $('#campaign-messages-modal .tabs'),
          firstTab = $('#campaign-messages-modal .tabs a:first');

      tabs.tabs();
      firstTab.trigger('click');

      self._bindEvents();
    });
  };

  fn._openModal = function() {
    this.modal.modal({
      complete: this._onCloseModal
    }).modal('open');
  };

  fn._onCloseModal = function() {
    location.reload();
  };

  fn._changeMessageStatus = function(event, status) {
    var element = $(event.currentTarget),
        messageId = element.data(status + '-message');
        row = element.parents('tr:first');

    var updater = new MessageStatusUpdater(row);
    if (status === 'approve') {
      updater.approve();
    } else {
      updater.reject();
    }

    this._bindEvents();
  };

  fn._approveMessage = function(event) {
    this._changeMessageStatus(event, 'approve');
  };

  fn._rejectMessage = function(event) {
    this._changeMessageStatus(event, 'reject');
  };

  return CampaignMessages;
});
