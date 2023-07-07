# Listing 2.8
# Tests for substrings_between using parameterized tests, part 6

def test_str_of_length_one
  # ... previous assertions here
  assert_equal ['b', 'byt byr'], substring_between('abcabyt byrc', 'a', 'c')
end

def test_open_and_close_tags_of_different_sizes
  # ... previous assertions here
  assert_equal %w[bb dd], substrings_between('a abb ddc ca abbcc', 'a a', 'c c')
end
