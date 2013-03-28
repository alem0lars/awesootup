require_relative 'bootstrap/knowledge_base'


namespace :bootstrap do

  namespace :db do

    namespace :populate do

      desc "Populate all of the bootstrap data in the database"
      task :all => [:knowledge_base]

      desc "Populate the KnowledgeBase"
      task :knowledge_base => :environment do
        KnowledgeBase.delete_all
        KnowledgeBaseBootstrap::DATA.each do |elem|
          KnowledgeBase.create(:name => elem[:name], :value => elem[:value])
        end
      end

    end

  end

end
