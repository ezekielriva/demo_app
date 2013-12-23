# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DemoApp::Application.initialize!

OmniAuth.config.on_failure = UsersController.action(:oauth_failure)
