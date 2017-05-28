define('campaign-messages', [], function() {
  function CampaignMessages() {
    this.buttons = $('.centralized-badge');
    this.modal = $('#campaign-messages-modal');

    this._bindEvents();
  };

  var fn = CampaignMessages.prototype;

  fn._bindEvents = function() {
    this.buttons.on('click', $.proxy(this._openModal, this));
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
      $('#campaign-messages-modal .tabs').tabs();
      $('#campaign-messages-modal .tabs a:first').trigger('click');
    });
  };

  return CampaignMessages;
});
