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
