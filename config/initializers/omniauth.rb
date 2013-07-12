Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  else
    provider :developer
  end
end
