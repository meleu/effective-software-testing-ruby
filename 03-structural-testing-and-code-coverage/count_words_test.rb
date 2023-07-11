require_relative 'test_helper'
require_relative 'count_words'

class CountWordsTest < Minitest::Test
  # Listing 3.2
  # Initial (incomplete) tests for CountWords

  def test_words_ending_with_s
    words = CountWords.count('cats dogs')
    assert_equal 2, words
  end

  def test_no_words_at_all
    words = CountWords.count('dog cat')
    assert_equal 0, words
  end

  # Listing 3.3
  # Testing for words that end in 'r'
  def test_words_that_end_in_r
    words = CountWords.count('car bar')
    assert_equal 2, words
  end
end
