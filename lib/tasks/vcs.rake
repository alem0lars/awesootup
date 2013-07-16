require 'highline/import'


namespace :vcs do

  desc "Commit the changes"
  task :commit do
    sh "git add -A", :verbose => false
    commit_msg = ask('Commit message? ') { |q| q.default = "Updated" }
    sh "git commit -m \"#{commit_msg}\"", :verbose => false
  end

  desc "Push in origin master"
  task :push => [:commit] do
    sh "git push origin master", :verbose => false
  end

  desc "Commit documentation changes to remote"
  task :commit_doc => :environment do
    FileUtils.cd(Rails.root.join('doc')) do
      Rake::Task['vcs:commit'].invoke rescue nil
    end
  end

  desc "Pull documentation from remote"
  task :pull_doc => [:commit_doc] do
    FileUtils.cd(Rails.root.join('doc')) do
      sh("git pull origin gh-pages", :verbose => false) rescue nil
    end
  end

  desc "Push documentation to remote"
  task :push_doc => [:commit_doc] do
    FileUtils.cd(Rails.root.join('doc')) do
      sh("git push origin gh-pages", :verbose => false) rescue nil
    end
  end

  desc "Synchronize documentation with remote"
  task :sync_doc => [:pull_doc, :push_doc]

end
