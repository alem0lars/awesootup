require 'highline/import'


namespace :vcs do

  desc "Commit the changes"
  task :commit do
    sh "git add -A"
    sh "git commit -m \"#{ask('Commit message? ')}\""
  end

  desc "Push in origin master"
  task :push => [:commit] do
    sh "git push origin master"
  end

end
