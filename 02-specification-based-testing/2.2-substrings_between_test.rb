# Listing 2.2
# Exploratory tests for substrings_between

require 'minitest/autorun'

require_relative 'string_utils'

class StringUtilsTest < Minitest::Test
  def test_simple_case
    assert_equal ['bc'], StringUtils.substrings_between('abcd', 'a', 'd')
  end

  def test_many_substrings
    assert_equal %w[bc bc], StringUtils.substrings_between('abcdabcdab', 'a', 'd')
  end

  def test_open_and_close_tags_long_than_one_char
    assert_equal %w[bc bf], StringUtils.substrings_between('aabcddaabfddaab', 'aa', 'dd')
  end
end
