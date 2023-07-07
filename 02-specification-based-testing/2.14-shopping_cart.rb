# Listing 2.14
# ShoppingCart and CartItem classes

class ShoppingCart
  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def total_price
    total = 0
    @items.each do |item|
      total += item.unit_price * item.quantity
    end
    total
  end
end

class CartItem
  attr_reader :product, :quantity, :unit_price

  def initialize(product, quantity, unit_price)
    @product = product
    @quantity = quantity
    @unit_price = unit_price
  end
end
