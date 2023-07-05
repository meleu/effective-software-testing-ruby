# Listing 1.7
# Ensuring that the first duplicate developer is returned

def test_developers_with_same_estimates
  estimates = [
    Estimate.new('Mauricio', 10),
    Estimate.new('Arie', 5),
    Estimate.new('Andy', 10),
    Estimate.new('Frank', 7),
    Estimate.new('Annibale', 5)
  ]

  devs = PlanningPoker.identify_extremes(estimates)

  expected = ['Mauricio', 'Arie']
  assert_equal expected.sort, devs.sort
end
