KNOWLEDGE_BASE_DATA = [
  {
    :name => :website_info,
    :value => {
      :title => 'Awesome Gentoo Setup',
      :acronym => 'Awesootup',
      :desc => 'Modular gentoo setup guides',
      :motto => 'The modular gentoo setup guides that work!',
      :license => {
        :name => 'GPLv3',
        :website => 'http://www.gnu.org/licenses/gpl-3.0.html'
      }
    }
  },
  {
    :name => :author,
    :value => {
      :name => 'Alessandro Molari',
      :email => 'molari.alessandro@gmail.com',
      :website => 'http://molarialessandro.info',
      :role => 'Modules, Guides, Website designer and author'
    }
  },
  {
    :name => :contributors,
    :value => {
      :listing => [
      ]
    }
  },
  {
    :name => :links,
    :value => {
      :project => {
        :fork => 'https://github.com/alem0lars/awesootup/fork_select',
        :pull => 'https://github.com/alem0lars/awesootup/pull/new/master',
        :new_issue => 'https://github.com/alem0lars/awesootup/issues/new'
      },
      :useful => [
        {
          :title => 'Author homepage',
          :url => 'http://molarialessandro.info'
        },
        {
          :title => 'Awesootup source code',
          :url => 'https://github.com/alem0lars/awesootup'
        },
        {
          :title => 'Awesootup issues',
          :url => 'https://github.com/alem0lars/awesootup/issues'
        }
      ]
    }
  }
]


def create_unless_exists(name, value)
  if KnowledgeBase.where('name = ?', name).empty?
    KnowledgeBase.create(:name => name, :value => value)
  end
end


namespace :bootstrap do

  namespace :db do

    namespace :populate do

      desc "Populate all of the bootstrap data in the database"
      task :all => [:knowledge_base]

      desc "Populate the KnowledgeBase"
      task :knowledge_base => :environment do
        KNOWLEDGE_BASE_DATA.each do |elem|
          create_unless_exists(elem[:name], elem[:value])
        end
      end

    end

  end

end
