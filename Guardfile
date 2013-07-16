ignore /public/
filter /.*\.(zip|tar|rar)/

notification :libnotify, :timeout => 4


# >> == setup ==================================================================

guard 'bundler' do

  watch('Gemfile')

end

guard 'migrate' do

  watch(%r{^db/migrate/(\d+).+\.rb})

  watch('db/seeds.rb')

end

guard 'rake', task: 'cmds:ctags' do

  watch(%r{^(?:app|lib)/.+\.rb$})

end


# >> == documentation ==========================================================

guard 'rake', task: 'doc:app' do

  watch(%r{^doc/src})

end

guard 'annotate', routes: true, tests: true, format: :rdoc, notify: true do

  watch('app/models/**/*.rb')

  watch('db/schema.rb')

  watch('config/routes.rb')

end


# >> == code analysis ==========================================================

guard 'brakeman', run_on_start: true, notifications: true do

  watch(%r{^config/.+\.rb$})

  watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
  watch(%r{^lib/.+\.rb$})

  watch('Gemfile')

end

guard :cane do

  watch(/.*\.rb/)

end


# >> == backends ===============================================================

guard 'rails', debugger: true, start_on_start: true do

  watch('Gemfile.lock')

  watch(%r{^(config|lib)/.*})

end

guard 'livereload' do

  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})

  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m|
    "/assets/#{m[3]}"
  }

end

guard :rspec do

  # When a spec changes RSpec that spec
  watch(%r{^spec/.+_spec\.rb$})
  # RSpec all when the helper changes
  watch('spec/spec_helper.rb') { "spec" }
  # RSpec all on support files change
  watch(%r{^spec/support/(.+)\.rb$}) { "spec" }

  # When a route in `routes.rb` changes run all `spec/routing` specs
  watch('config/routes.rb') { "spec/routing" }

  # When a controller changes, run these specs:
  # - `spec/routing/<cntr_name>_routing_spec.rb`
  # - `spec/controllers/<cntr_name>_controller_spec.rb`
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) { |m|
    [ "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/integration"
    ]
  }

  # When the basic controller (`ApplicationController`) changes,
  # run all controllers specs (every spec in `spec/controllers`)
  watch('app/controllers/application_controller.rb') {
    [ "spec/controllers",
      "spec/integration"
    ]
  }

  # Run the corresponding spec when a model changes
  watch(%r{^app/models/(.+)\.rb$}) { |m|
    "spec/models/#{m[1]}_spec.rb"
  }

  # Run the corresponding spec when a view changes
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) { |m|
    [ "spec/views/#{m[1]}_spec.rb",
      "spec/integration"
    ]
  }

  # Run the corresponding spec when a helper changes
  watch(%r{^app/helpers/(.+)_(helper)\.rb$}) { |m|
    [ "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/integration"
    ]
  }

  # Run the corresponding spec when a mailer changes
  watch(%r{^app/mailers/(.+)\.rb$}) { |m| "spec/mailers/#{m[1]}_spec.rb" }

end

