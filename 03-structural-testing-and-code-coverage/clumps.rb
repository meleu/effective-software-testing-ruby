# Listing 3.9
# Implementing the code clumps requirement
class Clumps
  def self.count_clumps(nums)
    return 0 if nums.nil? || nums.empty?

    count = 0
    prev = nums[0]
    in_clump = false

    # using drop(1) to start from the second element of the array
    nums.drop(1).each do |num|
      if num == prev && !in_clump
        in_clump = true
        count += 1
      end

      if num != prev
        prev = num
        in_clump = false
      end
    end

    count
  end
end
