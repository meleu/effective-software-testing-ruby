# Listing 4.8
# Another post-condition for Basket's add method

def add(product, quantity_to_add)
  raise(StandardError, 'Product is required') if product.nil?
  raise(StandardError, 'Quantity has to be greater than zero') if quantity_to_add <= 0

  old_total_value = @total_value

  # add the product in the basket
  # update the total value

  raise(StandardError, 'Product was not inserted in the basket') unless @basket.key?(product)
  raise(StandardError, 'Total value should be greater than previous total value') if @total_value < old_total_value
end
