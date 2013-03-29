# Recursively convert keys to symbols
def symbolize(obj)
  if obj.is_a? Hash
    obj.inject({ }) { |m, (k, v)| m[k.to_sym] = symbolize(v); m }
  elsif obj.is_a? Array
    obj.inject([]) { |m, v| m << symbolize(v); m }
  else
    obj
  end
end


namespace :bootstrap do

  namespace :db do

    namespace :populate do

      desc "Populate all of the bootstrap data in the database"
      task :all => [:knowledge_base]

      desc "Populate the KnowledgeBase"
      task :knowledge_base => :environment do
        KnowledgeBase.delete_all

        initial_data_pth = Rails.root.join('config').join('initial_data')
        ext_name = 'yml'
        Dir.glob(initial_data_pth.join('**').join("*.#{ext_name}")) do |file_pth|
          name = File.basename(file_pth, ".#{ext_name}")
          value = symbolize(YAML.load_file(file_pth))
          KnowledgeBase.create(:name => name, :value => value)
        end
      end

    end

  end

end
