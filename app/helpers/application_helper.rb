module ApplicationHelper

  def typed_content(type, content, pre_id, pre_class)
    case type.to_sym
    when :list
      content_tag(:ul, id: "#{pre_id}-items",
          :class => "#{pre_class}-items") do
        content.collect do |item|
          content_tag(:li, :class => "#{pre_class}-item") do
            item.html_safe
          end
        end.reduce(:<<)
      end
    when :plain
      content_tag(:div, id: "#{pre_id}-content-wrp",
          :class => "#{pre_class}-content-wrp") do
        content_tag(:div, id: "#{pre_id}-content",
            :class => "#{pre_class}-content") do
          content.html_safe
        end
      end
    end
  end

end
