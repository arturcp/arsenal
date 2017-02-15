define('shopping-cart', [], function() {
  function ShoppingCart() {
    this.productsCount = $('[data-products-count]');
    this.totalPrice = $('[data-total-price]');
    this.itemCounter = $('.shopping-cart__item-counter');
    this.items = {}

    this._buildCart();
    this._bindEvents();
  };

  var fn = ShoppingCart.prototype;

  fn._buildCart = function() {
    var self = this;

    $.each($('.price-line'), function(index, item) {
      var id = $(item).data('item-id'),
          price = $(item).data('item-price'),
          quantity = $(item).find('.shopping-cart__item-counter').val();

      self.items[id] = {
        price: price,
        quantity: quantity
      };
    });
  };

  fn._bindEvents = function() {
    this.itemCounter.on('keyup mouseup', this._changeItemPrice.bind(this));
  };

  fn._changeItemPrice = function(e) {
    var element = $(e.currentTarget),
        container = element.parents('.price-line'),
        id = container.data('item-id');

    this.items[id].quantity = parseFloat(element.val());

    container.find('[data-product-price]').html('R$ ' + this.items[id].quantity * this.items[id].price);

    this._recalculateCheckoutInfo();
  };

  fn._recalculateCheckoutInfo = function() {
    var count = 0,
        price = 0,
        self = this;

    for (var key in this.items) {
      count += self.items[key].quantity;
      price += self.items[key].quantity * self.items[key].price;
    }

    var complement = count == 1 ? 'item' : 'items';

    this.productsCount.html('Você escolheu <b>' + count + ' ' + complement + '</b>');
    this.totalPrice.html('Valor Total: <b>R$ ' + price + '</b>');
  };

  return ShoppingCart;
});
