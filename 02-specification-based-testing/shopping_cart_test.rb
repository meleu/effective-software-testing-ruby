require 'minitest/autorun'

require_relative 'shopping_cart'

class ShoppingCartTest < Minitest::Test
  def setup
    @cart = ShoppingCart.new
  end

  def test_no_items
    assert_equal 0, @cart.total_price
  end

  def test_items_in_the_cart
    @cart.add(CartItem.new('TV', 1, 120))
    assert_equal 120, @cart.total_price

    @cart.add(CartItem.new('Chocolate', 2, 2.5))
    assert_equal (120 + 2.5 * 2), @cart.total_price
  end
end
