source 'https://rubygems.org'

gem "rails", "3.2.13"

gem "haml"
gem "jquery-rails"

# Use PostgreSQL as DBMS
gem "pg"
# Search using PostgreSQL full-text search
gem "pg_search"
# Manage i18n through Redis
gem "redis"

# To use ActiveModel has_secure_password
gem "bcrypt-ruby", "~> 3.0.0"

# Interactive console
gem "highline"
# Print formatted ruby objects
gem "awesome_print"

# Administration interface
gem "activeadmin"
gem "meta_search", ">= 1.1.0.pre"

# Users Authentication
gem "omniauth"
gem "omniauth-github"

# Use monads in ruby
gem "monadic"

# Gems used only for assets and not required in production envs by default
group :assets do
  gem "sass-rails", "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.1"
  gem "haml-rails"
  gem "uglifier", ">= 1.0.3"
  gem "zurb-foundation"
  gem "foundation-icons-sass-rails"
end

group :development, :test do
  # { Ruby testing
  gem "rspec-rails", "~> 2.0"
  gem "rr", require: false
  gem "capybara"
  gem "factory_girl"
  gem "factory_girl_rails"
  # }
  # { Javascript testing
  gem "jasminerice", github: "bradphelan/jasminerice"
  # }
end

group :development do
  gem "debugger" # Enable the debugger
  gem "foreman" # Processes management
  gem "brakeman", require: false # Security scanner
  gem "cane" # Complexity analyzer
  gem "annotate" # Sourcecode commenter
  gem "libnotify" # Used to trigger OS notifications
  # { Guard (handle fs events) with plugins
  gem "guard"
  gem "guard-bundler"
  gem "guard-rake"
  gem "guard-rails"
  gem "guard-migrate"
  gem "guard-rspec"
  gem "guard-jasmine"
  gem "guard-livereload"
  gem "guard-annotate"
  gem "guard-brakeman"
  gem "guard-cane"
  # }
  # { Pry (console) with plugins
  gem "pry-rails"
  gem "pry-coolline"
  gem "pry-remote-em"
  gem "pry-debugger"
  gem "pry-vterm_aliases"
  # }
end

group :doc do
  gem "yard"
  gem "redcarpet"
end
