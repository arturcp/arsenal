define('orders', [], function() {
  function Orders() {
    this._bindEvents();
  };

  var fn = Orders.prototype;

  fn._bindEvents = function() {
    $('[data-reference]').on('click', this._toggleDescription);
  };

  fn._toggleDescription = function() {
    var reference = $(this).data('reference');

    $('#order-description-' + reference).toggle('slow');
  };

  return Orders;
});
