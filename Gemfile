source "https://rubygems.org"

# Specify the Rails version
gem "rails", "~> 8.0.1"

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 2.1"

# Use the Puma web server
gem "puma", ">= 5.0"

# Add gems for your blog API functionality
gem "bcrypt", "~> 3.1.7" # For secure password hashing
gem "jwt" # For JSON Web Token authentication
gem "pundit" # For managing authorization
gem "will_paginate" # For pagination functionality
gem "tzinfo-data", platforms: %i[windows jruby]
gem 'rack-attack'



# Optional Gems
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities
  gem "brakeman", require: false

  # Omakase Ruby styling
  gem "rubocop-rails-omakase", require: false

  # Add RSpec for testing
  gem "rspec-rails", "~> 7.1"
end

# Uncomment if needed for image processing or handling CORS
# gem "image_processing", "~> 1.2"
# gem "rack-cors"
