namespace :heroku do

  desc "Deploy the app into heroku"
  task :deploy do
    sh "git push heroku master", :verbose => false
  end

  desc "App dynos informations"
  task :ps do
    sh "heroku ps", :verbose => false
  end

  desc "Open the deployed app in the web browser"
  task :open do
    sh "heroku open", :verbose => false
  end

  desc "Show the logging informations"
  task :logs do
    sh "heroku logs", :verbose => false
  end

  desc "Run the rails console in the deployed app"
  task :console do
    sh "heroku run rails console", :verbose => false
  end

  namespace :db do

    desc "Database informations"
    task :info do
      sh "heroku pg:info", :verbose => false
    end

    desc "Database console"
    task :console do
      sh "heroku pg:psql", :verbose => false
    end

  end

end
