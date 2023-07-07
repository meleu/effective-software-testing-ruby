# Postal codes in some imaginary country are always composed of four numbers
# and two letters: for example, 2628CD. Numbers are in the range [1000, 4000].
# Letters are in the range [C, M].
#
# Consider a program that receives two inputs—an integer (for the four num-
# bers) and a string (for the two letters)—and returns true (valid postal code) or
# false (invalid postal code). The boundaries for this program appear to be
# straightforward:
# - Anything below 1000: invalid
# - [1000, 4000]: valid
# - Anything above 4000: invalid
# - [A, B]: invalid
# - [C, M]: valid
# - [N, Z]: invalid

require 'minitest/autorun'

class PostalCode
  def self.validate(code)
    return false if code.length != 6

    number = code[0, 4].to_i
    letters = code[-2, 2]

    return false if number < 1000 || number > 4000

    letters.chars.each do |char|
      return false if char < 'C' || char > 'M'
    end

    true
  end
end

class PostalCodeTest < Minitest::Test
  def test_invalid_number_of_digits
    refute PostalCode.validate('1CM')
    refute PostalCode.validate('22CM')
    refute PostalCode.validate('333CM')
    refute PostalCode.validate('4444M')
    refute PostalCode.validate('4444CDE')
  end

  # - Anything below 1000: invalid
  def test_numbers_below_1000_are_invalid
    refute PostalCode.validate('0999CM')
    refute PostalCode.validate('0001CM')
  end

  # - Anything above 4000: invalid
  def test_numbers_above_4000_are_invalid
    refute PostalCode.validate('4001CM')
    refute PostalCode.validate('4444CM')
  end

  # - [A, B]: invalid
  # - [N, Z]: invalid
  def test_invalid_letters
    refute PostalCode.validate('1111AA')
    refute PostalCode.validate('1111BB')
    refute PostalCode.validate('1111NN')
    refute PostalCode.validate('1111ZZ')
    refute PostalCode.validate('1111CZ')
    refute PostalCode.validate('1111AM')
  end

  # - [1000, 4000]: valid
  # - [C, M]: valid
  def test_valid_codes
    assert PostalCode.validate('1000CC')
    assert PostalCode.validate('1001CC')
    assert PostalCode.validate('1000CM')
    assert PostalCode.validate('3999FG')
    assert PostalCode.validate('4000CC')
    assert PostalCode.validate('4000MM')
    assert PostalCode.validate('2233HI')
  end
end
