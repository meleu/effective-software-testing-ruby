# Listing 3.7
# Three new test cases for left_pad
generator = [
  # [str, size, pad_str, expected]
  # ... others here
  ['abc', 5, '--', '--abc'],  # T10
  ['abc', 5, '---', '--abc'], # T11
  ['abc', 5, '-', '--abc']    # T12
]
