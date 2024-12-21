# Add FactoryBot for creating test data, if you're using it
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # Use transactional fixtures to ensure the database is cleaned between tests
  config.use_transactional_fixtures = true

  # Set the default format for test outputs
  config.formatter = :documentation

  # Add additional configuration here if needed
end
