# Chapter 3 - Structural testing and code coverage

## Main takeaways

### Video explaining MC/DC

Here's a video with the author of the book explaining the process of
"Modified Condition/Decision Coverage" (aka MC/DC):

<https://youtu.be/HzmnCVaICQ4>

## Caveats

### Code-coverage hightlights in VSCode

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
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::LcovFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )
end

require 'minitest/autorun'
```

- Install the [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) VSCode extension.
- In order to have the highlight in the whole line (just like in the book), I set `"coverage-gutters.showLineCoverage": true` (already present in [.vscode/settings.json](../.vscode/settings.json))
