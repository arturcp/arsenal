class ShoppingCart
  def initialize(session)
    @cart = session || {}
  end

  def add(item_id, quantity)
    key = item_id.to_s.to_sym

    if quantity <= 0
      remove(key)
    else
      @cart[key] = quantity
    end
  end

  def remove(item_id)
    @cart.delete(item_id.to_s.to_sym)
  end

  def total
    @cart.values.reduce(0, &:+) || 0
  end

  def price
    items.sum(&:price_for_current_amount)
  end

  def items
    @cart.clone.map do |item_id, quantity|
      item = Item.find(item_id.to_s.to_i)
      item.current_amount = quantity

      item
    end
  end
end
