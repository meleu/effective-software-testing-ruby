# The "final" PlanningPoker implementation

IllegalArgumentException = Class.new(StandardError)

Estimate = Struct.new(:developer, :value)

class PlanningPoker
  def self.identify_extremes(estimates)
    if estimates.nil?
      raise(IllegalArgumentException, 'estimates cannot be nil')
    end

    if estimates.length <= 1
      raise(IllegalArgumentException, 'there has to be more than 1 estimate in the list')
    end

    lowest_estimate = nil
    highest_estimate = nil

    estimates.each do |estimate|
      if highest_estimate.nil? || estimate.value > highest_estimate.value
        highest_estimate = estimate
      end

      if lowest_estimate.nil? || estimate.value < lowest_estimate.value
        lowest_estimate = estimate
      end
    end

    return [] if lowest_estimate.value == highest_estimate.value

    [lowest_estimate.developer, highest_estimate.developer]
  end
end
