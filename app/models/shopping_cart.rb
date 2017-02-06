class ShoppingCart
  attr_reader :cart

  def initialize(session)
    @cart = session[:cart] || {}
  end

  def add(item_id, quantity = 1)
    key = item_id.to_s

    if quantity <= 0
      remove(key)
    else
      @cart[key] = @cart[key].to_i + quantity
    end
  end

  def remove(item_id)
    @cart.delete(item_id.to_s)
  end

  def total
    @cart.values.reduce(0, &:+) || 0
  end

  def price
    items.sum(&:price_for_current_amount)
  end

  def items
    @cart.clone.map do |item_id, quantity|
      item = Item.find(item_id.to_i)
      item.current_amount = quantity

      item
    end
  end
end
