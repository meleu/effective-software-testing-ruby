# Listing 2.7
# Tests for substrings_between, part 5
def test_no_substring_between_open_and_close_tags
  assert_equal [''], substrings_between('aabb', 'aa', 'bb')
end
