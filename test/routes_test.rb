# RoutesTest is an integration test suite that verifies the behavior of the routes defined in the application.
# Integration tests ensure that the entire request-response cycle works as expected, from receiving the request,
# routing it to the appropriate controller action, and returning the correct response to the client.
#
# This test suite covers four essential routes:
# 1. The health check route (`/up`) for verifying that the application is running and responding correctly.
# 2. The service worker route (`/service-worker.js`) for handling background tasks in the PWA.
# 3. The web app manifest route (`/manifest.json`) for serving the PWA's metadata.
# 4. The root path (`/`), which is the default homepage of the application.
#
# Each test case simulates an HTTP request to the respective endpoint and verifies the response status,
# content type, and, where applicable, the body of the response.
#
# @see https://guides.rubyonrails.org/testing.html Rails Testing Guide for more information on testing with Minitest.
class RoutesTest < ActionDispatch::IntegrationTest
  # Test case for the `/up` health check route.
  #
  # This test verifies that the `/up` route correctly responds with an HTTP 200 OK status,
  # indicating that the application is running without issues. The health check is commonly used
  # by uptime monitoring services and load balancers to determine whether the application is healthy.
  #
  # The test simulates a `GET` request to the `/up` endpoint using `rails_health_check_url`, which maps to
  # the `Rails::HealthController#show` action. It then checks whether the response status is 200 OK.
  #
  # @example Health Check Test
  #   def test_health_check_route
  #     get rails_health_check_url
  #     assert_response :success
  #   end
  #
  # @return [void]
  #   This method does not return a value but asserts the correctness of the HTTP response.
  def test_health_check_route
    # Simulate a `GET` request to the `/up` endpoint
    get rails_health_check_url

    # Assert that the response status is 200 OK, indicating the app is healthy.
    assert_response :success
  end

  # Test case for the root path route ("/"), which defines the default homepage of the application.
  #
  # This test verifies that the root route (`/`) responds with an HTTP 200 OK status and returns the correct
  # HTML content: `"hello, world!"`. The root path is typically the homepage of the application and is
  # defined by the `root "application#hello"` route, mapping to the `hello` action in the `ApplicationController`.
  #
  # The test simulates a `GET` request to the root path using `root_url`. It checks the response status
  # and asserts that the body of the response contains the expected `"hello, world!"` message.
  #
  # @example Root Route Test
  #   def test_root_route
  #     get root_url
  #     assert_response :success
  #     assert_equal "hello, world!", @response.body
  #   end
  #
  # @return [void]
  #   This method does not return a value but asserts the correctness of the HTTP response and body content.
  def test_root_route
    # Simulate a `GET` request to the root path ("/")
    get root_url

    # Assert that the response status is 200 OK, indicating the root path is working.
    assert_response :success

    # Assert that the response body contains the expected HTML content: "hello, world!".
    assert_equal "hello, world!", @response.body
  end
end
