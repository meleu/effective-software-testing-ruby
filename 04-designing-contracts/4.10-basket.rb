# Listing 4.10
# Invariants of the Basket class

class Basket
  @total_value = 0
  @basket = {}

  def add(product, quantity_to_add)
    raise(StandardError, 'Product is required') if product.nil?
    raise(StandardError, 'Quantity has to be greater than zero') if quantity_to_add <= 0

    # add the product in the basket
    # update the total value

    raise(StandardError, 'Product was not inserted in the basket') unless @basket.key?(product)
    raise(StandardError, 'Total value should be greater than previous total value') if @total_value < old_total_value

    # The invariant ensures that the total value is greater than or equal to 0.
    raise(StandarError, "Total value can't be negative.") if @total_value.negative?
  end

  def remove(product)
    raise(StandardError, "product can't be null") if product.nil?
    raise(StandardError, 'Product must already be in the basket') unless @basket.key?(product)

    # ...
    # remove the product from the basket
    # update the total value
    # ...

    raise(StandardError, 'Product is still in the basket') if @basket.key?(product)

    # The same invariant check for the remove
    raise(StandarError, "Total value can't be negative.") if @total_value.negative?
  end
end
