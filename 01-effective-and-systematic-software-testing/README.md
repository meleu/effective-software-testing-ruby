# Chapter 1 - Effective and systematic software testing

## Main takeaways

### The 7 Testing Principles

1. Exhaustive testing is impossible.
2. Know when to stop.
3. Pesticide paradox: variability is important.
4. Bugs happen in some places more than others.
5. Testing will never be perfect or enough ("test show the presence of bugs, not absence").
6. Context is king.
7. Absence-of-errors fallacy: verification is not validation.

### Testing Pyramid

```
                 /  \
                /    \
more real      /      \
and complex   / manual \         <-- exploratory tests
  ^          /----------\
  |         /   system   \       <-- tests the main/risky
  |        /    tests     \          flow of the app
  |       /----------------\
  |      /   integration    \    <-- complex integrations
  |     /       tests        \       with external services
  |    /----------------------\
  |   /         unit           \ <-- all business rules
  |  /          tests           \    should be tested here
  | /----------------------------\
```

## Caveats

### Property-based testing

Listing 1.6 mentions **property-based testing** with [jqwik](https://jqwik.net/).
I'm (still) not sure about the best way to do this property-based testing in
Ruby. After googling, I think these are the 2 relevant options:

- [Rantly](https://github.com/rantly-rb/rantly)
- [PropCheck](https://github.com/Qqwy/ruby-prop_check)

I'm not really satisfied with the way I wrote Listing 1.6 in Ruby, but I plan to
revisit that code reading Chapter 5, which is exactly about Property-based
testing.
