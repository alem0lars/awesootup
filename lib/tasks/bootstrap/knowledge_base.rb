module KnowledgeBaseBootstrap

  DATA = [

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
    },

    {
      :name => :website_content,
      :value => {

        :features => {
          :title => 'Features',
          :listing => [
            {
              :id => 'modularity',
              :title =>
                'Modularity is the keyword for a lot of possibilities',
              :type => :list,
              :content => [
                'Start with the&nbsp'                                          +
                '<a class="scroll-to select-tab" href="javascript:void(0)"'    +
                '   data-scroll-to="awesootupbuilder-wrp"'                     +
                '   data-select-tab="awesootupbuilder-standalone-title">'      +
                '  <span class="label">standalone</span> awesootup'            +
                '</a>',
                'Start with a&nbsp'                                            +
                '<a class="scroll-to select-tab" href="javascript:void(0)"'    +
                '   data-scroll-to="awesootupbuilder-wrp"'                     +
                '   data-select-tab="awesootupbuilder-popular-title">'         +
                '  <span class="label">popular</span> awesootup'               +
                '</a>',
                'Create your&nbsp'                                             +
                '<a class="scroll-to select-tab" href="javascript:void(0)"'    +
                '   data-scroll-to="awesootupbuilder-wrp"'                     +
                '   data-select-tab="awesootupbuilder-custom-title">'          +
                '  <span class="label">custom</span>'                          +
                '  awesootup, by selecting the desired modules'                +
                '</a>'
              ]
            }
          ]
        },

        :news => {
          :title => 'News',
          :listing => [
            { :title => 'Version 1.0', :content => 'Basic features released' }
          ]
        }
      }
    }
  ]

end
