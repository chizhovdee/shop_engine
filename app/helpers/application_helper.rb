module ApplicationHelper
  def admin_state(resource)
    text = ""

    resource.class.states.each do |state|
      if resource.state == state.to_s
        text << "<span class='status_tag #{ resource.state } #{ :complete if resource.state == 'visible' }'>#{ resource.state }</span>"
      else
        text << link_to(state, polymorphic_url([:change_state, :admin, resource], :state => state), :remote => true, :method => :put)
      end

      text << "<br />"
    end

    text.html_safe
  end

  def meta_title(text = '')
    text.blank? ? t(".app_title") : "#{ text } | #{ t(".app_title") }"
  end

  def title(text)
    content_for(:title){text}

    text
  end
end
