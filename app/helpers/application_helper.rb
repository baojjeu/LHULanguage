module ApplicationHelper

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''


    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def gravatar_for(user, options = { size: 128, class: nil })
    gravatar_id = Digest::MD5.hexdigest(user.email)
    content_tag :span, class: options[:class] do
      image_tag "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:size]}"
    end
  end
end