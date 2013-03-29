module ApplicationHelper

  def typed_content(type, content, basic_id, basic_class)
    case type.to_sym
    when :list
      content_tag(:ul, :id => "#{basic_id}-items", :class => "#{basic_class}-items") do
        content.collect do |item|
          content_tag(:li, :class => "#{basic_class}-item") do
            item.html_safe
          end
        end.reduce(:<<)
      end
    when :plain
      content_tag(:div, :id => "#{basic_id}-content-wrp", :class => "#{basic_class}-content-wrp") do
        content_tag(:div, :id => "#{basic_id}-content", :class => "#{basic_class}-content") do
          content.html_safe
        end
      end
    end
  end

end
