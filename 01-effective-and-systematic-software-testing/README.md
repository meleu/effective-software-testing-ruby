# Chapter 1 - Effective and Systematic Software Testing

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
more real      /         \
and complex   /  manual   \       <-- exploratory tests
  ^          /-------------\
  |         / system tests  \     <-- tests the main/risky
  |        /-----------------\        flow of the app
  |       / integration tests \   <-- complex integrations
  |      /---------------------\      with external services
  |     /       unit tests      \ <-- all business rules
  |    /-------------------------\    should be tested here
```
