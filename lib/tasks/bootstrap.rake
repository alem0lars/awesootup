# == Utility functions =========================================================

def create_from_md(klass, file_name)
  File.open(Rails.root.join(file_name), 'r') do |file|
    name_regex = /^\=\=\s+(?<name>.+)\s*$/
    lines = file.readlines

    lines.length.times do |idx|

      if md = name_regex.match(lines[idx])
        content = ''; idx = idx + 1

        while (idx < lines.length) && !name_regex.match(lines[idx])
          content << lines[idx].strip
          idx = idx + 1
        end

        old = klass.find_by_name(md[:name])
        klass.delete(old.first.id) if !old.nil? && old.length > 0

        puts ">> Creating a #{klass} with name:\n#{md[:name]}" +
            (content.empty? ? '' : "\n   and content:\n#{content}")

        if content.empty?
          klass.create(:name => md[:name])
        else
          klass.create(:name => md[:name], :content => content)
        end
      end
    end

  end
end


# == Tasks =====================================================================

namespace :bootstrap do

  namespace :db do

    desc "Bootstrap all data"
    task :all => [:awesootup_features, :awesootup_news]

    desc "Bootstrap awesootup features"
    task :awesootup_features => :environment do
      create_from_md(AwesootupFeature, 'FEATURES.md')
    end

    desc "Bootstrap awesootup news"
    task :awesootup_news => :environment do
      create_from_md(AwesootupNews, 'CHANGELOG.md')
    end

  end

end
