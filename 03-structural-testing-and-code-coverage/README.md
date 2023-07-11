# Chapter 3 - Structural testing and code coverage

## Main takeaways

### Code Coverage

**Code coverage should not be used as a number to be achieved**. Rather, coverage
tools should be used to support developers in performing structural testing
(that is, understanding what parts are not covered and why).

### Video explaining MC/DC

Here's a video with the author of the book explaining the process of
"Modified Condition/Decision Coverage" (aka MC/DC):

<https://youtu.be/HzmnCVaICQ4>

### Mutation Testing

At the end of the chapter the Mutation Testing technique is mentioned, but with
no examples. The concept is pretty cool and it seems to be an valuable technique,
but using Aniche's words:

> As a community, we are taking steps toward a solution, but we are not there yet.

I've googled about mutation testing in Ruby.

The [mutant gem](https://github.com/mbj/mutant) seems to be the most mature gem
for mutation testing in Ruby, however it requires a license to be used (free for
open source projects, check their README). I didn't try it.

Another gem I stumble upon while googling was [crude-mutant](https://github.com/kellysutton/crude-mutant).
I followed the instructions in the README and unfortunately it didn't work.

## Caveats

### Limitation: Code-Coverage for branches

For code coverage I'm using simplecov, which doesn't have all the features provided
by JaCoCo (the tool mentioned in the book).

I noticed that simplecov only counts the "then" and the "else" branches, ignoring
the branches created by "or" conditions.

Example:

```ruby
if last == 's' || last == 'r'
  words += 1
end
```

This logic has 4 branches (actually only 3, as `last` would never be simultaneously
equal to `s` and `r`). If we have 2 tests, one covering the situation where the
if statement is true, and other for false, simplecov considers this 100% of branch
covering.

Let's say we have one test where `last == 's'` (the `if` result is true) and another one
where `last == 'a'` (the `if` result is false). SimpleCov would consider this as
100% of branch covering even if we didn't test any situation where `last == 'r'`.

### Code-coverage hightlights in VSCode

- Install the [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) VSCode extension.
- In order to have the highlight in the whole line (just like in the book), I set `"coverage-gutters.showLineCoverage": true` (already present in [.vscode/settings.json](../.vscode/settings.json))
- Install `simplecov` and `simplecov-lcov` (already present in the repo's [Gemfile](../Gemfile)).
- Add this config to your test (already present in [test_helper.rb](./test_helper.rb)):

```ruby
# simplecov configs MUST be before requiring 'minitest'
require 'simplecov'
require 'simplecov-lcov'
SimpleCov::Formatter::LcovFormatter.config do |conf|
  conf.report_with_single_file = true
  conf.output_directory = 'coverage'
  conf.lcov_file_name = 'lcov.info'
end
SimpleCov.start do
  enable_coverage :branch
  # primary_coverage :branch
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::LcovFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )
end

require 'minitest/autorun'
```

After running a test, the coverage report will be generated at `./coverage/index.html`.

If you installed Coverage Gutters, you can toggle the Code Coverage highlights with
`Ctrl`+`Shift`+`5`.
