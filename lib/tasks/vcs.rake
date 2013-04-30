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

  desc "Commit changes in the gh-pages branch"
  task :commit_ghp do
    starting_branch_name = `git rev-parse --abbrev-ref HEAD`

    begin
      sh "git checkout gh-pages", :verbose => false
      Rake::Task['vcs:commit'].invoke
    rescue
      nil
    end

    sh "git checkout #{starting_branch_name}"
  end

  desc "Push in github pages"
  task :push_ghp => [:commit_ghp] do
    starting_branch_name = `git rev-parse --abbrev-ref HEAD`

    sh "git checkout gh-pages", :verbose => false
    sh "git push origin gh-pages", :verbose => false

    sh "git checkout #{starting_branch_name}"
  end

end
