# The routes configuration for the Rails application.
# This file defines how HTTP requests are mapped to controller actions using Rails' routing system.
# Routes define how URLs should behave and which controller methods they should invoke.
# It is crucial to correctly define routes to ensure that users, clients, and services can interact with
# the web application correctly.
#
# This particular configuration sets up routes for a Progressive Web App (PWA), a health check route for
# uptime monitoring, and a root route that displays a basic "hello, world!" response.
#
# @see https://guides.rubyonrails.org/routing.html Rails Routing Guide for more information on routing in Rails.
Rails.application.routes.draw do
  # Health check route for monitoring the application's uptime.
  #
  # This route maps the `/up` URL to the `show` action in the `Rails::HealthController`.
  # The health check is essential for verifying that the application is running properly. It typically returns a
  # 200 OK status if the app is healthy and a 500 Internal Server Error if there are issues during boot.
  #
  # This route is commonly used by uptime monitoring services or load balancers to determine if the application
  # is alive and responding to requests. By checking this endpoint, external systems can monitor the app's availability.
  #
  # @example Health Check Endpoint
  #   GET /up
  #   Response:
  #   - Status: 200 OK if the app is healthy
  #   - Status: 500 Internal Server Error if there is an issue
  #
  # @return [void]
  #   This route does not return a value but triggers the health check action to respond with the status.
  # @route GET /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path route, which defines the default homepage of the application.
  #
  # The root route specifies the URL path that users will land on when they visit the base URL of the application
  # (e.g., https://your-app.com/). In this case, the root route is mapped to the `hello` action in the `ApplicationController`.
  #
  # The `hello` action is a simple controller action that renders an HTML response saying "hello, world!". This is typically
  # used as a placeholder or minimal demonstration for the homepage of the app. In production applications, the root path
  # usually points to a more complex home page or dashboard.
  #
  # @example Root Path Endpoint
  #   GET /
  #   Response:
  #   - HTML content: "hello, world!"
  #
  # @note This route maps the root URL `/` to the `hello` action in the `ApplicationController`.
  # @return [void]
  #   This route does not return a value but renders the HTML response defined in the `ApplicationController#hello`.
  # @route GET /
  root "application#hello"
end
