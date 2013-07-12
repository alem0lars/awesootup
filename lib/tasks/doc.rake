require 'yard'


DOC_SRC_NAME = File.join('doc', 'src')

# Clear the doc:app task et al
Rake::Task["doc:app"].clear
Rake::Task["doc/app"].clear
Rake::Task["doc/app/index.html"].clear


APP_FILES = [
  'app/**/*.rb'
]

LIB_FILES = [
  'lib/**/*.rb'
]

MAIN_FILE = File.join(DOC_SRC_NAME, 'MAIN.html')
STATIC_FILES = [
  'CHANGELOG.md',
  'FEATURES.md',
  'LICENSE.md',
  "#{DOC_SRC_NAME}/guides/**"
] << MAIN_FILE


namespace :doc do

  desc "Generate documentation for the application"
  YARD::Rake::YardocTask.new(:app) do |t|
    t.files = APP_FILES | LIB_FILES | ['-'] | STATIC_FILES
    t.options = ['--main', MAIN_FILE]
  end

  desc "Cleanup documentation"
  task :cleanup do
    Dir.glob(Rails.root.join('doc', '*')) do |pth|
      FileUtils.rm_r(pth) unless Rails.root.join(DOC_SRC_NAME).to_s == pth
    end
  end

end
