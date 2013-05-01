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
  task :commit_doc => :environment do
    FileUtils.cd(Rails.root.join('doc')) do
      Rake::Task['vcs:commit'].invoke rescue nil
    end
  end

  desc "Push in github pages"
  task :push_doc => [:commit_ghp] do
    FileUtils.cd(Rails.root.join('doc')) do
      sh "git push origin gh-pages", :verbose => false
    end
  end

end
