# Listing 2.13
# Tests for a pre-condition of the add program
digits_out_of_range = [
  [[1, -1, 1], [1]],
  [[1], [1, -1, 1]],
  [[1, 10, 1], [1]],
  [[1], [1, 11, 1]]
]

digits_out_of_range.each do |left, right|
  it 'throw exception when digits are out of range' do
    assert_raises(IllegalArgumentException) { NumberUtils.add(left, right) }
  end
end
