# frozen_string_literal: true

require "active_support/core_ext/integer/time"

# The test environment is specifically tailored for running the application's test suite.
# It is isolated from other environments (development, production) to ensure that tests
# do not interfere with real data or settings. This environment is configured to be a
# "scratch space" where data can be freely created, modified, and destroyed without any
# lasting effects.
#
# Note: Since this application does not utilize a database, all database-related
# configurations and dependencies have been removed to prevent unnecessary errors
# during test execution.
#
# @see https://guides.rubyonrails.org/configuring.html#configuring-a-specific-environment
Rails.application.configure do
  # Settings specified here will take precedence over those in `config/application.rb`.
  # This allows for environment-specific configurations that override the general settings.

  # Disable code reloading. In the test environment, it's not necessary to reload code between
  # test runs as the test suite typically runs in a single process. This improves performance
  # by avoiding the overhead of monitoring file changes.
  #
  # @note Reloading is handled differently in test environments and is generally disabled to
  #       ensure consistent test results.
  config.enable_reloading = false

  # Eager loading loads all application code at startup. This is useful in CI environments
  # to catch any issues related to code loading that might not surface during individual test runs.
  #
  # @env CI [Boolean] Indicates whether the workflow is running in a Continuous Integration environment.
  # @note Setting `eager_load` to true ensures that all code is loaded before tests run,
  #       helping to identify any loading-related errors early in the CI process.
  config.eager_load = ENV["CI"].present?

  # Configure the public file server for tests with appropriate Cache-Control headers to
  # improve performance. This setup ensures that static assets are served efficiently during
  # test runs, reducing the time spent loading these assets.
  #
  # @param [Hash<String, String>] headers A hash of HTTP headers to apply to the public file server.
  # @example Setting Cache-Control headers to cache assets for 1 hour.
  #   config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.hour.to_i}" }
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.hour.to_i}" }

  # Show full error reports for all requests. This is essential in the test environment to
  # ensure that any errors are immediately visible and can be addressed promptly.
  #
  # @note In production, detailed error reports are typically disabled to prevent leaking
  #       sensitive information. However, in test environments, full error reports facilitate
  #       debugging and verification of application behavior.
  config.consider_all_requests_local = true

  # Disable action controller caching to ensure that each test runs in a clean state without
  # interference from cached data. This guarantees that tests are reliable and not affected by
  # residual data from previous test runs.
  #
  # @note Caching can introduce variability in test results, so it's disabled to maintain
  #       test integrity.
  config.action_controller.perform_caching = false

  # Use a null store for caching, effectively disabling caching mechanisms. This complements
  # the previous setting by ensuring that no cached data is stored or retrieved during tests.
  #
  # @see https://api.rubyonrails.org/classes/ActiveSupport/Cache/NullStore.html
  # @note The NullStore is a cache store that doesn't store anything, making it ideal for
  #       environments where caching is unnecessary or could cause issues.
  config.cache_store = :null_store

  # Configure Action Dispatch to render exception templates for rescuable exceptions while
  # raising exceptions for other types. This ensures that expected errors are handled gracefully
  # while unexpected errors are surfaced during testing.
  #
  # @param [Symbol] show_exceptions Determines how exceptions are handled.
  #   - :rescuable: Renders exception templates for exceptions that can be rescued.
  #   - :all: Renders exception templates for all exceptions.
  #   - false: Raises exceptions without rendering templates.
  config.action_dispatch.show_exceptions = :rescuable

  # Disable request forgery protection in the test environment. Since tests are typically run
  # in isolation and do not involve actual user sessions, CSRF protection is unnecessary and can
  # be safely disabled to simplify test setups.
  #
  # @note Disabling forgery protection prevents tests from needing to handle CSRF tokens,
  #       streamlining the testing process.
  config.action_controller.allow_forgery_protection = false

  # Configure Active Storage to use the :test service, which stores uploaded files in a temporary
  # location. This setup ensures that file uploads during tests do not persist and do not require
  # actual storage services.
  #
  # @see https://edgeguides.rubyonrails.org/active_storage_overview.html#testing
  # @note If your application does not utilize Active Storage, this configuration can be safely
  #       removed to further eliminate dependencies on storage services.
  # config.active_storage.service = :test

  # Disable caching for Action Mailer templates, even if Action Controller caching is enabled.
  # This ensures that emails rendered during tests are always fresh and not served from a cache,
  # providing accurate test results.
  #
  # @note Email caching is generally unnecessary in tests and can obscure whether email
  #       content is being generated correctly.
  config.action_mailer.perform_caching = false

  # Configure Action Mailer to use the :test delivery method, which prevents emails from being
  # sent to the real world. Instead, sent emails are accumulated in the `ActionMailer::Base.deliveries`
  # array, allowing tests to inspect and verify email content without sending actual emails.
  #
  # @see https://api.rubyonrails.org/classes/ActionMailer/Base.html#method-c-deliveries
  # @note Using the :test delivery method is crucial for ensuring that tests do not inadvertently
  #       send real emails, which could lead to spam or privacy issues.
  config.action_mailer.delivery_method = :test

  # Set default URL options for Action Mailer. Since mailers do not have access to the incoming
  # request context, the `:host` parameter must be provided manually. This ensures that URLs
  # generated in emails are correct and point to the intended host.
  #
  # @param [Hash<String, String>] default_url_options A hash containing default URL options.
  # @option default_url_options [String] :host The host name for URL generation.
  # @example Setting the host to "www.example.com".
  #   config.action_mailer.default_url_options = { host: "www.example.com" }
  config.action_mailer.default_url_options = { host: "www.example.com" }

  # Configure Active Support to print deprecation notices to the standard error output (stderr).
  # Deprecation notices inform developers about outdated methods or practices that will be removed
  # in future Rails versions, allowing them to update their code accordingly.
  #
  # @param [Symbol] deprecation Indicates where to log deprecation warnings.
  #   - :stderr: Logs warnings to standard error.
  #   - :log: Logs warnings to the Rails logger.
  #   - :notify: Sends notifications via Active Support notifications.
  config.active_support.deprecation = :stderr

  # Configure Active Support to raise exceptions for disallowed deprecations. This setting ensures
  # that any use of deprecated features that have been explicitly disallowed will cause the test
  # suite to fail, prompting immediate attention and remediation.
  #
  # @note This is useful for enforcing the removal of certain deprecated features from the codebase.
  config.active_support.disallowed_deprecation = :raise

  # Specify which deprecation warnings are disallowed and should raise exceptions. By listing
  # specific deprecation messages, you can control which deprecated features are considered critical
  # and must be addressed immediately.
  #
  # @param [Array<String>] disallowed_deprecation_warnings A list of deprecation warning messages
  #   that should be disallowed and cause exceptions to be raised.
  # @example Disallow deprecations related to `old_method`.
  #   config.active_support.disallowed_deprecation_warnings = ["old_method is deprecated"]
  config.active_support.disallowed_deprecation_warnings = []

  # Uncomment the following configuration to raise errors for missing translations.
  # This is useful for ensuring that all user-facing text is properly translated, preventing
  # scenarios where untranslated strings appear in the application.
  #
  # @see https://guides.rubyonrails.org/i18n.html#raise-an-error-for-missing-translations
  #
  # @note Enabling this can help catch missing translations during test runs, ensuring comprehensive
  #       localization coverage.
  # config.i18n.raise_on_missing_translations = true

  # Uncomment the following configuration to annotate rendered views with their filenames.
  # This can be helpful for debugging and understanding which templates are being rendered,
  # especially in complex applications with many nested views.
  #
  # @param [Boolean] annotate_rendered_view_with_filenames When set to true, each rendered view
  #   will include an HTML comment indicating the source file of the template.
  #
  # @note This is typically only useful during development or debugging and can be left
  #       commented out in most cases.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Configure Action Controller to raise an error when a `before_action` callback's
  # `only` or `except` options reference actions that do not exist. This helps ensure
  # that callback filters are correctly applied and that no typos or misconfigurations
  # prevent callbacks from functioning as intended.
  #
  # @param [Boolean] raise_on_missing_callback_actions Determines whether to raise errors for missing actions.
  # @note Enabling this provides stricter validation of controller callbacks, promoting better
  #       code quality and reducing potential bugs related to callback misconfigurations.
  config.action_controller.raise_on_missing_callback_actions = true

  # ------------------------------------------------------------
  # Database-Free Configuration Adjustments:
  # ------------------------------------------------------------
  #
  # Since this application does not utilize a database, it's crucial to ensure that
  # no residual configurations or dependencies related to Active Record or other
  # database-related services remain. The following adjustments have been made:
  #
  # 1. **Active Record Exclusion:**
  #    - In `config/application.rb`, Active Record has been excluded by removing `require "active_record/railtie"`.
  #
  # 2. **Active Storage Configuration:**
  #    - Although Active Storage is configured to use the `:test` service, if your application does not
  #      utilize Active Storage for file uploads, you can safely remove or comment out the following line:
  #      ```ruby
  #      config.active_storage.service = :test
  #      ```
  #
  #    - Removing this line ensures that Active Storage does not attempt to interact with any storage
  #      services, further eliminating dependencies on components that may expect a database.
  #
  # 3. **Database Cleaning and Preparation:**
  #    - Ensure that the CI pipeline (`.github/workflows/ci.yml`) does not include any steps related
  #      to database setup or migration. These steps have already been removed based on previous instructions.
  #
  # 4. **Gemfile Adjustments:**
  #    - Verify that the `Gemfile` does not include any database-related gems such as `sqlite3`, `pg`, or
  #      `mysql2`. If present, these gems should be removed to prevent unnecessary dependencies.
  #
  # 5. **Test Suite Configuration:**
  #    - Ensure that the test suite does not include any tests that rely on database interactions.
  #      Since the application is a simple "Hello World" app without database dependencies, this should
  #      already be satisfied.
  #
  # By meticulously removing or disabling all database-related configurations and dependencies,
  # you ensure that the test environment operates smoothly without encountering errors related
  # to missing databases or schemas.
  # ------------------------------------------------------------
end
