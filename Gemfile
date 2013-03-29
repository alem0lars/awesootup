source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'haml'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Interactive console
gem 'highline'
# Print formatted ruby objects
gem 'awesome_print'

# Administration interface
gem 'activeadmin'
gem 'meta_search', '>= 1.1.0.pre'

# Gems used only for assets and not required in production envs by default
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~> 4.0.9'
  gem 'foundation-icons-sass-rails'
end

group :test do
  # Use SQLite for testing
  gem 'sqlite3'
end

group :development do
  # Enable the debugger
  gem 'debugger'
  # Use PostgreSQL in development
  gem 'pg'
end

group :production do
  # Use PostgreSQL in production
  gem 'pg'
end
