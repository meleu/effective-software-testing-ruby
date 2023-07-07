# Exploratory tests for substrings_between

require 'minitest/autorun'

require_relative 'string_utils'

class StringUtilsTest < Minitest::Test
  include StringUtils

  def test_str_is_null_or_empty
    assert_nil substrings_between(nil, 'a', 'b')
    assert_empty substrings_between('', 'a', 'b')
  end

  def test_open_is_null_or_empty
    assert_nil substrings_between('abc', nil, 'b')
    assert_nil substrings_between('abc', '', 'b')
  end

  def test_close_is_null_or_empty
    assert_nil substrings_between('abc', 'a', nil)
    assert_nil substrings_between('abc', 'a', '')
  end

  def test_str_of_length_one
    assert_nil substrings_between('a', 'a', 'b')
    assert_nil substrings_between('a', 'b', 'a')
    assert_nil substrings_between('a', 'b', 'b')
    assert_nil substrings_between('a', 'a', 'a')
  end

  def test_open_and_close_of_length_one
    assert_nil substrings_between('abc', 'x', 'y')
    assert_nil substrings_between('abc', 'a', 'y')
    assert_nil substrings_between('abc', 'x', 'c')

    assert_equal ['b'], substrings_between('abc', 'a', 'c')
    assert_equal %w[b b], substrings_between('abcabc', 'a', 'c')
    assert_equal ['b', 'byt byr'], substrings_between('abcabyt byrc', 'a', 'c')
  end

  def test_open_and_close_tags_of_different_sizes
    assert_nil substrings_between('aabcc', 'xx', 'yy')
    assert_nil substrings_between('aabcc', 'aa', 'yy')
    assert_nil substrings_between('aabcc', 'xx', 'cc')

    assert_equal ['bb'], substrings_between('aabbcc', 'aa', 'cc')
    assert_equal %w[bb ee], substrings_between('aabbccaaeecc', 'aa', 'cc')
    assert_equal ['bb dd'], substrings_between('a abb ddc ca abbcc', 'a a', 'c c')
  end

  def test_no_substring_between_open_and_close_tags
    assert_equal [''], substrings_between('aabb', 'aa', 'bb')
  end
end
