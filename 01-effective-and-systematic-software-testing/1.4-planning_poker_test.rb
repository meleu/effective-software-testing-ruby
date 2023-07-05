# Listing 1.4
# Test cases for nil, an empty list, and a one-element list

require 'minitest/autorun'

require_relative 'planning_poker'

class PlanningPokerTest < Minitest::Test
  def test_reject_nil_input
    assert_raises(IllegalArgumentException) { PlanningPoker.identify_extremes(nil) }
  end

  def test_reject_empty_list
    assert_raises(IllegalArgumentException) { PlanningPoker.identify_extremes([]) }
  end

  def test_reject_single_estimate
    estimates = [Estimate.new('Eleanor', 1)]

    assert_raises(IllegalArgumentException) { PlanningPoker.identify_extremes(estimates) }
  end
end
