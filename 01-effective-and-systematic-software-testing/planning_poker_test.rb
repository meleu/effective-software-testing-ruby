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

  def test_developers_with_same_estimates
    estimates = [
      Estimate.new('Mauricio', 10),
      Estimate.new('Arie', 5),
      Estimate.new('Andy', 10),
      Estimate.new('Frank', 7),
      Estimate.new('Annibale', 5)
    ]

    devs = PlanningPoker.identify_extremes(estimates)

    expected = %w[Mauricio Arie]
    assert_equal expected.sort, devs.sort
  end

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
end
