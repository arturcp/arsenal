define('orders', [], function() {
  function Orders() {
    this._bindEvents();
  };

  var fn = Orders.prototype;

  fn._bindEvents = function() {
    $('[data-reference]').on('click', this._toggleDescription);
  };

  fn._toggleDescription = function() {
    var reference = $(this).data('reference'),
        descriptionContainer = $('#order-description-' + reference),
        parentBackgroundColor = $(this).parent().parent().css('background-color');

    descriptionContainer.css('background-color', parentBackgroundColor)
    descriptionContainer.toggle('slow');
  };

  return Orders;
});
