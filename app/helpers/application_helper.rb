module ApplicationHelper

  def typed_content(type, content, basic_id, basic_class)
    case type
    when :list
      content_tag(:ul, :id => "#{basic_id}-items", :class => "#{basic_class}-items") do
        content.each do |item|
          content_tag(:li, :class => "#{basic_class}-item") do
            item
          end
        end
      end
    end
  end

end
