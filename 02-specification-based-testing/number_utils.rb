IllegalArgumentException = Class.new(StandardError)

module NumberUtils
  def self.add(left, right)
    return nil if left.nil? || right.nil?

    left.reverse!
    right.reverse!

    result = []
    carry = 0

    [left.length, right.length].max.times do |i|
      left_digit = left.length > i ? left[i] : 0
      right_digit = right.length > i ? right[i] : 0

      raise(IllegalArgumentException) if !(0..9).include?(left_digit) || !(0..9).include?(right_digit)

      sum = left_digit + right_digit + carry

      result.unshift(sum % 10)

      carry = sum / 10
    end

    result.unshift(carry) if carry.positive?

    result.shift while result.length > 1 && result[0].zero?

    result
  end
end
