# Listing 4.7
# Basket's add method with its pre-conditions

def add(product, quantity_to_add)
  raise(StandardError, 'Product is required') if product.nil?
  raise(StandardError, 'Quantity has to be greater than zero') if quantity_to_add <= 0

  # ...
  # add the product in the basket
  # update the total value
  # ...

  raise(StandardError, 'Product was not inserted in the basket') unless @basket.key?(product)
end
