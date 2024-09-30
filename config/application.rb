require_relative "boot"

# Only include the frameworks needed for the HelloApp
# The following list removes unnecessary frameworks such as ActiveRecord, which is not used in this application.
require "rails"
require "active_model/railtie"     # Provides validations, callbacks, and attribute methods.
require "active_job/railtie"       # Provides an interface for background jobs.
require "action_controller/railtie" # Handles routing, filters, and controller logic.
require "action_mailer/railtie"    # Allows sending emails through the application.
require "action_view/railtie"      # Provides view rendering and template helpers.
require "action_cable/engine"      # Manages real-time features like WebSockets.
require "rails/test_unit/railtie"  # Manages test framework integration.

# Require the gems listed in Gemfile, including any gems
# specified in development, test, or production groups.
Bundler.require(*Rails.groups)

module HelloApp
  # Application class represents the configuration and setup for the HelloApp Rails application.
  # This class is responsible for initializing Rails with the specific defaults and configurations
  # required to run the application.
  class Application < Rails::Application
    # Initialize configuration defaults for the version of Rails that this app is generated with.
    # This ensures that the application gets the default behavior introduced in Rails 7.2.
    #
    # @note This sets up default configuration options for this Rails version.
    config.load_defaults 7.2

    # The `autoload_lib` configuration defines subdirectories in the `lib` folder
    # that should not be automatically reloaded or eager loaded by Rails. In this case,
    # subdirectories like `assets` and `tasks` are ignored because they don't contain `.rb` files
    # or files that need to be reloaded by Rails. This can help improve performance.
    #
    # @param [Array<String>] ignore A list of subdirectory names to ignore within the `lib` folder.
    # @example Ignoring `assets` and `tasks` folders in `lib`.
    #   config.autoload_lib(ignore: %w[assets tasks])
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties.
    #
    # Settings can be overridden in specific environments (e.g., development, test, production)
    # using files located in the `config/environments` directory. These settings can be used to
    # fine-tune the behavior of the app depending on its environment.
    #
    # @example Setting the time zone for the application.
    #   config.time_zone = "Central Time (US & Canada)"
    #
    # @example Adding custom directories to the eager load paths.
    #   config.eager_load_paths << Rails.root.join("extras")
  end
end
