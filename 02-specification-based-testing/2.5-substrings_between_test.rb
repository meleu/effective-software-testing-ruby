# Listing 2.5
# Tests for substrings_between, part 3
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
end
