# frozen_string_literal: true

# Set the Rails environment to "test" unless it's already specified.
# This ensures that tests are always run in the test environment.
#
# @note This must be set before requiring the environment to ensure that
#       the test configuration is loaded.
ENV["RAILS_ENV"] ||= "test"

# Load the Rails environment and application configuration.
# This ensures that all necessary initializations for the test environment
# are loaded and ready for the tests to run.
require_relative "../config/environment"

# Load Rails' default test helpers. This includes essential methods and helpers
# for setting up and running tests in a Rails application, such as assertions
# and the ability to run tests in parallel.
require "rails/test_help"

# The ActiveSupport module provides the core extensions to Ruby's standard library.
# These extensions add new functionality to existing Ruby classes and modules.
module ActiveSupport
  # The TestCase class provides a base class for all unit tests in the Rails application.
  # It includes Rails' built-in testing framework and helpers, allowing for easier testing.
  class TestCase
    # ------------------------------------------------------------
    # Parallel Testing Configuration:
    # ------------------------------------------------------------
    # Enable parallel test execution. This feature splits the test suite into
    # multiple processes, allowing tests to run in parallel across available CPU cores.
    # This speeds up the test suite, especially when running a large number of tests.
    #
    # @param workers [Integer, Symbol] The number of parallel workers. Setting it to
    #   `:number_of_processors` will automatically use the number of CPU cores available
    #   on the machine to determine how many parallel workers to run.
    #
    # @note Parallel testing is highly beneficial for larger test suites, but make sure
    #       that your tests are thread-safe and can be run in parallel without issues.
    #       If your tests rely on shared state, you may need to address potential race conditions.
    parallelize(workers: :number_of_processors)

    # ------------------------------------------------------------
    # Fixture Setup (Removed for a Database-Free App):
    # ------------------------------------------------------------
    # Rails fixtures are typically used to preload data into the test database for
    # test cases that interact with models. Since this application does not use
    # ActiveRecord or a database, the fixtures feature should be removed to prevent
    # errors related to missing database configurations.
    #
    # @note If you don't use a database, the `fixtures` line should be removed to
    #       prevent any assumptions that fixture data will be loaded for tests.
    #
    # REMOVE: fixtures :all
    # ------------------------------------------------------------

    # ------------------------------------------------------------
    # Additional Helper Methods:
    # ------------------------------------------------------------
    # You can define any helper methods in this section that will be shared across
    # all test cases. These methods are useful for reducing duplication across tests
    # and keeping test code DRY (Don't Repeat Yourself).
    #
    # Example:
    #   def login_as(user)
    #     # Custom login logic for tests that require authentication.
    #   end
    #
    # @note These helper methods can be accessed in all your test cases, providing
    #       common functionality and setup that can be reused.
    #
    # Add more helper methods to be used by all tests here...
  end
end
