class ShoppingCart
  attr_reader :cart

  def initialize(session)
    @session = session
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
    @cart.values.reduce(0, :+) || 0
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

  # Public: Adds items in the chart based on a JSON. It is useful to update the
  # cart content based on the data on the screen, since the user can change the
  # quantity of each item using javascript.
  #
  # The expected format for the params is:
  #
  # {
  #   items: {
  #    { "1": { "quantity": 10 }, "2": { "quantity" :20 } }
  # }
  #
  # Returns nothing.
  def build_from_params(params)
    @cart = {}

    hash = JSON.parse(params[:items])
    hash.each do |item_id, data|
      add(item_id, data['quantity'].to_i)
    end

    @session[:cart] = @cart
  end
end
