# Listing 2.10
# Tests for the add method

require 'minitest/autorun'

require_relative 'number_utils'

describe '#add' do
  list_of_test_cases = [
    # [left, right, expected]
    [nil, [7, 2], nil], # T1
    [[], [7, 2], [7, 2]], # T2
    [[9, 8], nil, nil], # T3
    [[9, 8], [], [9, 8]], # T4

    [[1], [2], [3]], # T5
    [[9], [2], [1, 1]], # T6

    [[2, 2], [3, 3], [5, 5]], # T7
    [[2, 9], [2, 3], [5, 2]], # T8
    [[2, 9, 3], [1, 8, 3], [4, 7, 6]], # T9
    [[1, 7, 9], [2, 6, 8], [4, 4, 7]], # T10
    [[1, 9, 1, 7, 1], [1, 8, 1, 6, 1], [3, 7, 3, 3, 2]], # T11
    [[9, 9, 8], [1, 7, 2], [1, 1, 7, 0]], # T12

    [[2, 2], [3], [2, 5]], # T13.1
    [[3], [2, 2], [2, 5]], # T13.2
    [[2, 2], [9], [3, 1]], # T14.1
    [[9], [2, 2], [3, 1]], # T14.2
    [[1, 7, 3], [9, 2], [2, 6, 5]], # T15.1
    [[9, 2], [1, 7, 3], [2, 6, 5]], # T15.1
    [[3, 1, 7, 9], [2, 6, 8], [3, 4, 4, 7]], # T16.1
    [[2, 6, 8], [3, 1, 7, 9], [3, 4, 4, 7]], # T16.2
    [[1, 9, 1, 7, 1], [2, 1, 8, 1, 6, 1], [2, 3, 7, 3, 3, 2]], # T17.1
    [[2, 1, 8, 1, 6, 1], [1, 9, 1, 7, 1], [2, 3, 7, 3, 3, 2]], # T17.2
    [[9, 9, 8], [9, 1, 7, 2], [1, 0, 1, 7, 0]], # T18.1
    [[9, 1, 7, 2], [9, 9, 8], [1, 0, 1, 7, 0]], # T18.1
    [[0, 0, 0, 1, 2], [0, 2, 3], [3, 5]], # T19
    [[0, 0, 0, 1, 2], [0, 2, 9], [4, 1]], # T20
    [[9, 9], [1], [1, 0, 0]] # T20
  ]

  list_of_test_cases.each do |left, right, expected|
    it "add(#{left}, #{right}) = #{expected}" do
      if expected.nil?
        assert_nil NumberUtils.add(left, right)
      else
        assert_equal expected, NumberUtils.add(left, right)
      end
    end
  end

  digits_out_of_range = [
    [[1, -1, 1], [1]],
    [[1], [1, -1, 1]],
    [[1, 10, 1], [1]],
    [[1], [1, 11, 1]]
  ]

  digits_out_of_range.each do |left, right|
    it 'throw exception when digits are out of range' do
      assert_raises(IllegalArgumentException) { NumberUtils.add(left, right) }
    end
  end
end
