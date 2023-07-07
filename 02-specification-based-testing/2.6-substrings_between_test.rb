# Listing 2.6
# Tests for substrings_between, part 4
def test_open_and_close_tags_of_different_sizes
  assert_nil substrings_between('aabcc', 'xx', 'yy')
  assert_nil substrings_between('aabcc', 'aa', 'yy')
  assert_nil substrings_between('aabcc', 'xx', 'cc')

  assert_equal ['bb'], substrings_between('aabbcc', 'aa', 'cc')
  assert_equal %w[bb ee], substrings_between('aabbccaaeecc', 'aa', 'cc')
end
