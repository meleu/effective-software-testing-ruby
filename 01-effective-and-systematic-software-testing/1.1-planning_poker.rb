# Listing 1.1
# The first PlanningPoker implementation

class PlanningPoker
  def self.identify_extremes(estimates)
    lowest_estimate = nil
    highest_estimate = nil

    estimates.each do |estimate|
      if highest_estimate.nil? || estimate.value > highest_estimate.value
        highest_estimate = estimate
      elsif lowest_estimate.nil? || estimate.value < lowest_estimate.value
        lowest_estimate = estimate
      end
    end

    [lowest_estimate.developer, highest_estimate.developer]
  end
end
