# Listing 4.9
# Pre- and post-conditions for the remove method

def remove(product)
  raise(StandardError, "product can't be null") if product.nil?
  raise(StandardError, 'Product must already be in the basket') unless @basket.key?(product)

  # ...
  # remove the product from the basket
  # update the total value
  # ...

  raise(StandardError, 'Product is still in the basket') if @basket.key?(product)
end
