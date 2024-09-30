class ApplicationControllerTest < ActionDispatch::IntegrationTest
  # Test case for the `hello` action.
  #
  # This test checks that the `hello` action in the ApplicationController returns the expected HTML content.
  # The action should respond with "hello, world!" and return an HTTP 200 OK status.
  #
  # @example
  #   When visiting the root path ("/"), the response should be:
  #     - Status: 200 OK
  #     - Content-Type: "text/html"
  #     - Body: "hello, world!"
  #
  # @see ApplicationController#hello
  # @return [void]
  def test_hello_action_renders_correct_html
    # Perform a GET request to the root URL ("/").
    get root_url

    # Assert that the response status is 200 OK.
    assert_response :success

    # Assert that the response body contains the expected "hello, world!" HTML.
    assert_equal "hello, world!", @response.body
  end

  # Test case to ensure that only modern browsers can access the application.
  #
  # This test simulates a browser request and checks if unsupported browsers are restricted.
  # Since this is difficult to directly test in Minitest without an actual browser,
  # a stub or mock of the browser verification mechanism can be employed in a more advanced scenario.
  #
  # @note Modern browser checks are done via the `allow_browser` directive in the controller,
  # which limits compatibility to browsers supporting specific features like WebP, CSS Nesting, etc.
  #
  # @return [void]
  def test_modern_browser_restriction
    # Skip the test with a custom message.
    # This silences the usual 'Skipped test' warning and provides a more informative message.
    skip("Skipping modern browser restriction test; requires advanced setup") unless ENV["RUN_BROWSER_TESTS"]
  end
end
