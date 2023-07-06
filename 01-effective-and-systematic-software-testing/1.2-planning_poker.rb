# Listing 1.2
# The bug fix in the PlanningPoker implementation

highest_estimate = estimate if highest_estimate.nil? || estimate.value > highest_estimate.value

lowest_estimate = estimate if lowest_estimate.nil? || estimate.value < lowest_estimate.value
