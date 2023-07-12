# Listing 4.12
# Pseudo-code for input validation

class ProductController
  # more code here ...

  def add(product_name, product_description, price)
    sanitized_product_name = sanitize(product_name)
    sanitized_product_description = sanitize(product_description)

    error_messages << 'Invalid product name' if valid_product_name?(sanitized_product_name)
    error_messages << 'Invalid product description' if valid_product_description?(sanitized_product_description)
    error_message << 'Invalid price' if valid_price_range?(price)

    if error_messages.empty?
      new_product = Product.new(sanitized_product_name, sanitized_product_description, price)
      new_product.save
    else
      redirect_to new_product_path, flash: { error: error_messages }
    end
  end
end
