# Listing 1.2
# The bug fix in the PlanningPoker implementation

if highest_estimate.nil? || estimate.value > highest_estimate.value
  highest_estimate = estimate
end

if lowest_estimate.nil? || estimate.value < lowest_estimate.value
  lowest_estimate = estimate
end
