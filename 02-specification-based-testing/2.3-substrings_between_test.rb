# Listing 2.3
# Tests for substrings_between, part 1

require 'minitest/autorun'

require_relative 'string_utils'

class StringUtilsTest < Minitest::Test
  include StringUtils

  def test_str_is_null_or_empty
    assert_nil substrings_between(nil, 'a', 'b')
    assert_empty substrings_between('', 'a', 'b')
  end
end
