require 'yard'


#clear the doc:app task et al
Rake::Task["doc:app"].clear
Rake::Task["doc/app"].clear
Rake::Task["doc/app/index.html"].clear

namespace :doc do

  desc "Generate documentation for the application"
  YARD::Rake::YardocTask.new(:app) do |t|
    t.files = ['app/**/*.rb', 'lib/**/*.rb', 'README.md', 'CHANGELOG.md', 'FEATURES.md', 'LICENSE.md']
  end

end
