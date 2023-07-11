require_relative 'test_helper'
require_relative 'left_pad'

# Listing 3.6
# Tests for LeftPad after specification-based testing

describe 'LeftPad' do
  include LeftPad

  generator = [
    # [str, size, pad_str, expected]
    [nil, 10, '-', nil],      # T1
    ['', 5, '-', '-----'],    # T2
    ['abc', -1, '-', 'abc'],  # T3
    ['abc', 5, nil, '  abc'], # T4
    ['abc', 5, '', '  abc'],  # T5
    ['abc', 5, '-', '--abc'], # T6
    ['abc', 3, '-', 'abc'],   # T7
    ['abc', 0, '-', 'abc'],   # T8
    ['abc', 2, '-', 'abc']    # T9
  ]

  generator.each do |str, size, pad_str, expected|
    it "left_pad(#{str}, #{size}, #{pad_str}) = #{expected}" do
      if expected.nil?
        assert_nil left_pad(str, size, pad_str)
      else
        assert_equal expected, left_pad(str, size, pad_str)
      end
    end
  end
end
