# The Rakefile defines tasks for running tests and other tasks related to the application.
# Rake is a build automation tool in Ruby, similar to Make in Unix.
# The Rakefile defines custom tasks that can be executed via the command line.
#
# In this example, the Rakefile contains tasks to run the test suite using Minitest.
# Minitest tasks are automatically loaded by Rails, but additional custom tasks can be defined here.
#
# @see https://guides.rubyonrails.org/command_line.html#rake Rake tasks in Rails
# @see https://github.com/ruby/rake Rake documentation

# Explicitly require the Rake::TestTask module to use it for defining test tasks.
require 'rake/testtask'
require_relative 'config/application'

Rails.application.load_tasks

# Task to run all tests in the `test/` directory.
#
# This task is the default Rake task that runs when `rake` is executed without arguments.
# It loads and executes all the test files in the `test/` directory, ensuring the entire application is tested.
#
# @example Running tests
#   $ rake test
#
# @see https://guides.rubyonrails.org/testing.html#running-tests Rails Guide on Running Tests
task default: :test

# Task to run the test suite.
#
# This task executes the Minitest suite and outputs the results in the terminal.
# Minitest automatically loads all test files ending with `_test.rb`.
#
# @note By default, Rails searches the `test/` directory for test files. It looks for files matching the pattern `*_test.rb`.
#
# @example Running the test suite with verbose output:
#   $ rake test TESTOPTS="--verbose"
#
# @return [void]
Rake::TestTask.new do |t|
  # Add the 'test' directory to the load path.
  t.libs << "test"

  # Define which test files to run (all files in `test/` directory).
  t.test_files = FileList['test/**/*_test.rb']

  # Enable verbose output when running tests.
  t.verbose = true
end
