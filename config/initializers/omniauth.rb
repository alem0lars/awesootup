# Enable the use of omniauth
Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  else
    provider :developer
  end
end

# Use the configured Rails.logger (instead of stdout)
OmniAuth.config.logger = Rails.logger
