# Listing 3.3
# Testing for words that end in 'r'
def test_words_that_end_in_r
  words = CountWords.count('car bar')
  assert_equal 2, words
end
