define('orders', [], function() {
  function Orders() {
    this.modal = $('#new-order-modal');

    this._bindEvents();
  };

  var fn = Orders.prototype;

  fn._bindEvents = function() {
    this._bindDescriptionEvent();
    $('[data-manual-purchase]').on('click', $.proxy(this._manualPurchase, this));

    this.modal.modal();
  };

  fn._bindDescriptionEvent = function() {
    $('[data-reference]').off('click').on('click', this._toggleDescription);
  };

  fn._toggleDescription = function() {
    var reference = $(this).data('reference');

    $('#order-description-' + reference).toggle('slow');
  };

  fn._manualPurchase = function() {
    var name = $('#new-purchase-name').val(),
        quantity = $('#new-purchase-quantity').val(),
        itemId = $('#new-purchase-items').val(),
        campaignId = $('#campaign_id').val(),
        url = $('[data-new-purchase-url]').data('new-purchase-url'),
        self = this;

    $.ajax({
      method: "POST",
      url: url,
      data: {
        name: name,
        quantity: quantity,
        item_id: itemId,
        campaign_id: campaignId
      }
    })
    .done(function(row) {
      self.modal.modal('close');
      $('[data-orders-list]').append(row);
      self._bindDescriptionEvent();
    });
  };

  return Orders;
});
