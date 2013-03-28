require 'highline/import'


namespace :vcs do

  desc "Commit the changes"
  task :commit do
    sh "git add -A", :verbose => false
    commit_msg = ask('Commit message? ') { |q| q.default = " " }
    sh "git commit -m \"#{commit_msg}\"", :verbose => false
  end

  desc "Push in origin master"
  task :push => [:commit] do
    sh "git push origin master", :verbose => false
  end

end
