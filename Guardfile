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
  watch('db/schema.rb')
  watch('app/models/**/*.rb')
  watch('config/routes.rb')
end


# >> == code analysis ==========================================================

guard 'brakeman', run_on_start: true, notifications: true do
  watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
  watch(%r{^config/.+\.rb$})
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
