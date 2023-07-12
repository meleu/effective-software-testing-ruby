# Listing 4.11
# invariant() method for the invariant check

class Basket
  def add(_product, _quantity_to_add)
    # ... method here ...
    raise(StandarError, "Total value can't be negative.") if invariant?
  end

  def remove(_product)
    # ... method here ...
    raise(StandarError, "Total value can't be negative.") if invariant?
  end

  def invariant?
    @total_value.negative?
  end
end
