module ApplicationHelper
  def admin_state(resource)
    text = ""

    resource.class.states.each do |state|
      if resource.state == state.to_s
        text << "<span class='status_tag #{ :complete if resource.state == 'visible' }'>#{ resource.state }</span>"
      else
        text << link_to(state, polymorphic_url([:change_state, :admin, resource], :state => state), :remote => true, :method => :put)
      end

      text << "<br />"
    end

    text.html_safe
  end
end
