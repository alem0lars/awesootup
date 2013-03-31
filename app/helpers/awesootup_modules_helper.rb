module AwesootupModulesHelper

  include ApplicationHelper

  def render_features(awesootup_module)
    [
      render_provides(awesootup_module.provides,
          :title => {:level => :h4, :text => t('title_features_provided')}),
      render_pre_reqs(awesootup_module.pre_reqs,
          :title => {:level => :h4, :text => t('title_features_pre_reqs')}),
      render_post_reqs(awesootup_module.post_reqs,
          :title => {:level => :h4, :text => t('title_features_post_reqs')})
    ].reduce(:<<)
  end

  def link_to_equally_satisfied(id, strict)
    name = strict ?
        t('title_awesootupmodules_equallysatisfied') :
        t('title_awesootupmodules_satisfied')
    desc = strict ?
        t('awesootupmodules_equallysatisfied_desc') :
        t('awesootupmodules_satisfied_desc')

    link_to(
      content_tag(:span, :'data-tooltip' => '', :class => 'has-tip',
          :title => desc) { name },
      awesootup_modules_path(:filtering => true, :type => :equally_satisfied,
          :strict => strict, :id => id),
      :class => 'small button'
    )
  end

  def link_to_alternatives(id, strict)
    name = strict ?
        t('title_awesootupmodules_strictalternative') :
        t('title_awesootupmodules_alternative')
    desc = strict ?
        t('awesootupmodules_strictalternative_desc') :
        t('awesootupmodules_alternative_desc')

    link_to(
      content_tag(:span, :'data-tooltip' => '', :class => 'has-tip',
          :title => desc) { name },
      awesootup_modules_path(:filtering => true, :type => :alternatives,
          :strict => strict, :id => id),
      :class => 'small button'
    )
  end

  def render_provides(data, opts = {})
    render_features(data, opts)
  end

  def render_pre_reqs(data, opts = {})
    render_features(data, opts)
  end

  def render_post_reqs(data, opts = {})
    render_features(data, opts)
  end

  # @param features_data Data used to render the features.
  #   It should be an Array.
  #   Each element should be a AwesootupModuleFeature object.
  #
  # @param opts Options for the features rendering:
  #   - :title => { :level => :h2, :text => 'My Title' }
  #     Add the title with the level and the text provided before the features.
  #
  # If block_given?
  #   The block will be used to render each feature (see render_feature method)
  #
  def render_features(features_data, opts = {}, &block)
    opts = {
      :title => nil
    }.merge(opts)

    out = []

    if opts[:title]
      out << content_tag(opts[:title][:level].to_sym) do
        opts[:title][:text].html_safe
      end
    end

    out << content_tag(:ul) do
      features_data.collect do |feature_data|
        render_feature(feature_data, opts, &block)
      end.reduce(:<<)
    end

    out.reduce(:<<)
  end

  # @param feature_data Data used to render the feature.
  #   It should contain a AwesootupModuleFeature object.
  #
  # @param opts Options for the feature rendering
  #
  # If block_given?
  #   Pass the block to the feature content renderer
  #
  def render_feature(feature_data, opts = {}, &block)
    opts = {
    }.merge(opts)

    content_tag(:li) do
      if feature_data[:desc] && !feature_data[:desc].empty?
        content_tag(:span, :'data-tooltip' => '', :class => 'has-tip',
            :title => feature_data[:desc]) do
          render_feature_content(feature_data[:name], &block)
        end
      else
        render_feature_content(feature_data[:name], &block)
      end
    end
  end

  # If block_given?
  #   The feature content will be in inline-list with the elements provided by
  #   the Array returned by the yield.
  #
  def render_feature_content(name, &block)
    if block_given?
      content_tag(:ul, :class => 'inline-list') do
        content_tag(:li) { name.html_safe }
        yield.reduce(:<<)
      end
    else
      name.html_safe
    end
  end

end
