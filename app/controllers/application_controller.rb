# ApplicationController is the base controller for the entire Rails application.
# All other controllers inherit from this controller.
# This class inherits from `ActionController::Base`, which provides a range of features such as
# rendering views, handling HTTP requests, and responding with the appropriate formats.
#
# This controller includes a custom browser restriction that only allows modern browsers
# to access the application. Modern browsers are defined as those supporting key web technologies
# like WebP images, Web Push Notifications, Badges API, Import Maps, CSS Nesting, and the CSS `:has()` selector.
#
# @note The `allow_browser` directive is used here to restrict browser compatibility. This ensures
# that the app will not be accessible via outdated or unsupported browsers, enhancing security,
# performance, and compatibility with modern web standards.
#
# @example A simple controller action
#   def hello
#     render html: "hello, world!"
#   end
#
#   The above example illustrates a basic controller action that renders "hello, world!" as HTML.
#
# @see https://guides.rubyonrails.org/action_controller_overview.html For a comprehensive guide to ActionController.
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting specific web technologies.
  # This filter ensures that only browsers with support for the following features can access the application:
  #
  # - **WebP Images**: A modern image format that provides superior lossless and lossy compression for images on the web.
  # - **Web Push Notifications**: A protocol that enables web applications to send notifications to users even when the browser is closed.
  # - **Badges API**: Allows web applications to set a badge on a document's or application's icon, such as a notification count.
  # - **Import Maps**: A modern JavaScript feature that allows developers to import modules by specifying a map of dependencies.
  # - **CSS Nesting**: A feature that allows developers to nest CSS rules inside other rules, making style sheets more concise and structured.
  # - **CSS `:has()` Selector**: A CSS relational pseudo-class that matches elements if they contain a specific descendant.
  #
  # This directive adds a layer of security and compatibility to the application, ensuring that
  # it is only used in environments that support the features needed for an optimal user experience.
  #
  # @param versions [Symbol] Specifies the browser compatibility rule. In this case, `:modern`
  # means that only modern browsers with the listed features are supported.
  #
  # @note If a user tries to access the application using an unsupported browser,
  # they will be blocked from accessing the content.
  #
  # @example Restricting to modern browsers:
  #   allow_browser versions: :modern
  allow_browser versions: :modern

  # Renders a simple "hello, world!" message as HTML.
  #
  # This action demonstrates a basic example of an HTTP response in Rails. When the `hello`
  # action is invoked, it returns an HTML response with the text "hello, world!".
  #
  # @return [void]
  # @raise [ActionView::MissingTemplate] If the template for the response is missing. In this case,
  # however, the content is directly provided as a string, so this error is highly unlikely.
  #
  # @example Rendering "hello, world!" in an HTTP response:
  #   def hello
  #     render html: "hello, world!"
  #   end
  #
  #   This renders a basic HTML response with the text "hello, world!".
  def hello
    render html: "hello, world!"
  end
end
