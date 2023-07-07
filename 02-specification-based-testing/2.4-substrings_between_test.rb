# Listing 2.4
# Tests for substrings_between, part 2
def test_open_is_null_or_empty
  assert_nil substrings_between('abc', nil, 'b')
  assert_nil substrings_between('abc', '', 'b')
end

def test_close_is_null_or_empty
  assert_nil substrings_between('abc', 'a', nil)
  assert_nil substrings_between('abc', 'a', '')
end
