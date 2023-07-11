require_relative 'test_helper'
require_relative 'clumps'

describe Clumps do
  generator = [
    # [nums, expected]
    [[], 0], # empty
    [nil, 0], # null
    [[1, 2, 2, 2, 1], 1], # one clump
    [[1], 0] # one element
  ]

  generator.each do |nums, expected|
    it "clumps(#{nums}) = #{expected}" do
      assert_equal expected, Clumps.count_clumps(nums)
    end
  end
end
