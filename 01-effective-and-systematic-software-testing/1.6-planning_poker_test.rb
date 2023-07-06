# Listing 1.6
# Property-based testing for multiple estimates
#
# NOTE: this is not really equivalent to the Listing 1.6 in the book!
#
# A promising gem to replace jqwik is Rantly: <https://github.com/rantly-rb/rantly>
#
# TODO: revisit this after reading chapter 5.

def test_in_any_order
  100.times do
    estimates = estimates_generator

    estimates << Estimate.new('MrLowEstimate', 1)
    estimates << Estimate.new('MrHighEstimate', 100)

    estimates.shuffle!

    devs = PlanningPoker.identify_extremes(estimates)

    expected = %w[MrLowEstimate MrHighEstimate]

    assert_equal expected.sort, devs.sort
  end
end

def estimates_generator
  estimates = []
  rand(1..100).times do
    estimates << Estimate.new(random_string_generator, random_estimate_between(2, 99))
  end
  estimates
end

def random_string_generator
  ('a'..'z').to_a.sample(5).join
end

def random_estimate_between(first, last)
  (first..last).to_a.sample
end
