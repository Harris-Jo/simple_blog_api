class Rack::Attack
    # Throttle login attempts (limit to 5 attempts per minute per IP)
    throttle('logins/ip', limit: 5, period: 1.minute) do |req|
      # Apply throttle to the login route for POST requests
      req.ip if req.path == '/login' && req.post?
    end
  
    # Return a custom error when rate limit is exceeded
    self.throttled_response = lambda do |env|
      [ 429,  # HTTP status code
        { 'Content-Type' => 'application/json' },  # Response headers
        [{ error: 'Too many login attempts, please try again later.' }.to_json]  # Response body
      ]
    end
  end
  