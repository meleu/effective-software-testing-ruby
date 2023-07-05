# Listing 1.9
# Testinf for an empty list if the estimates are all the same

def test_all_developers_with_same_estimates
  estimates = [
    Estimate.new('Mauricio', 10),
    Estimate.new('Arie', 10),
    Estimate.new('Andy', 10),
    Estimate.new('Frank', 10),
    Estimate.new('Annibale', 10)
  ]

  devs = PlanningPoker.identify_extremes(estimates)

  assert_empty devs
end
