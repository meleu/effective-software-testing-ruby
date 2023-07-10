# Chapter 2 - Specification-based testing

## Main takeaways

### The 7 steps for spec-based testing

1. Understand the requirement.
2. Explore the program.
3. Identify the partitions.
4. Analyze the boundaries.
5. Devise test cases.
6. Automate test cases.
7. Augment (creativity and experience).

#### 1. Understand the requirement, inputs and outputs

Read the requirements carefully.

- What should the program do?
- What should it not do?
- Does it handle specific corner cases?

Identify the input and output, their types, and their input domain.

Some of these characteristics can be found in the specs, others may not be explicitly stated.

#### 2. Explore the program

If you did not write the program yourself, play with it.

Call the program with different inputs and see what it produces as output.

#### 3. Identify the partitions

Three steps to identify the partitions:

1. Look at each input individually. Explore its type and the range of acceptable values (can it be null? is it a number ranging from 0 to 100? does it allow negative numbers?).
2. Look at how each variable may interact with another. Variables often have dependencies or put constraints on each other, and those should be tested.
3. Explore the possible types of outputs, and make sure you are testing them all. Pay attention to any implicit rules, logic, or expected behavior.

#### 4. Analyze the boundaries

**Bugs love boundaries**, so be extra thorough here.

Analyze the boundaries of all partitions you devised in the previous step.

#### 5. Devise test cases based on the partitions and boundaries

Testing all possible combinations may be too expensive, so part of the task is to reduce the number of combinations.

The common strategy is to test exceptional behavior only once and not combine it with the other partitions.

#### 6. Automate the test cases

**A test is only a test when it is automated.**

#### 7. Augment the test suite with creativity and experience

Revisit all the tests you created using your experience and creativity.

Did you miss something? Does your gut feeling tell you that the program may fail in a specific case? If so, add a new test case.

## Caveats

### Parameterized-tests

The book mentions [Junit's Parameterized Tests](https://junit.org/junit5/docs/5.3.0/user-guide/#writing-tests-parameterized-tests),
which is a way to make it possible to run a test multiple times with different
arguments.

There isn't a direct equivalent in Minitest, but I achieved a reasonable
solution using the [Minitest's Spec-style syntax](https://github.com/minitest/minitest#label-Specs). So, it works like this:

```ruby
describe '#add' do
  test_cases = [
    # [left, right, expected]
    [[1], [2], [3]], # T5
    [[9], [2], [1, 1]], # T6
    # more test cases here...
  ]

  test_cases.each do |left, right, expected|
    it "add(#{left}, #{right}) = #{expected}" do
      assert_equal expected, NumberUtils.add(left, right)
    end
  end
end
```

### DEPRECATED: Use assert_nil if expecting nil

When running an assert like this:

```ruby
assert_equal nil, my_method(my_arg)
```

We receive a warning like this:

```
DEPRECATED: Use assert_nil if expecting nil from my_test.rb:48. This will fail in Minitest 6.
```

For those who care about the longevity of their code, this is a scary warning,
isn't it?

In order to avoid such message I decided to sacrifice readability, resulting in
a code like this:

```ruby
  test_cases.each do |my_arg, expected|
    it "my_test" do
      if expected.nil?
        assert_nil my_method(my_arg)
      else
        assert_equal expected, my_method(my_arg)
      end
    end
  end
```
