# Listing 1.5
# Test case for a list with two elements

def test_two_estimates
  estimates = [
    Estimate.new('Mauricio', 10),
    Estimate.new('Frank', 5)
  ]

  devs = PlanningPoker.identify_extremes(estimates)

  expected = %w[Mauricio Frank]
  assert_equal expected.sort, devs.sort
end

def test_many_estimates
  estimates = [
    Estimate.new('Mauricio', 10),
    Estimate.new('Arie', 5),
    Estimate.new('Frank', 7)
  ]

  devs = PlanningPoker.identify_extremes(estimates)

  expected = %w[Mauricio Arie]
  assert_equal expected.sort, devs.sort
end
