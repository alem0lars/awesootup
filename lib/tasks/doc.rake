require 'yard'


APP_FILES = [
  'app/**/*.rb'
]

LIB_FILES = [
  'lib/**/*.rb'
]

STATIC_FILES = [
  'README.md',
  'CHANGELOG.md',
  'FEATURES.md',
  'LICENSE.md'
]


# Clear the doc:app task et al
Rake::Task["doc:app"].clear
Rake::Task["doc/app"].clear
Rake::Task["doc/app/index.html"].clear

namespace :doc do

  desc "Generate documentation for the application"
  YARD::Rake::YardocTask.new(:app) do |t|
    t.files = APP_FILES | LIB_FILES | ['-'] | STATIC_FILES
  end

end
