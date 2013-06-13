ActiveAdmin.register Page do
  config.sort_order = "position_asc"

  form :partial => "form"

  show do
    attributes_table do
      row :id
      row :position
      row :title
      row :alias
      row :body do |resource|
        resource.body.html_safe
      end

      row :created_at
      row :updated_at

      row :state do |resource| 
        status_tag(resource.state, (:complete if resource.state == 'visible'))
      end
    end

    active_admin_comments
  end

  index do
    column :id
    column :position

    column :title

    column :alias

    column :created_at

    column :updated_at

    column :state do |resource|
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

    default_actions
  end


  member_action :change_state, :method => :put do
    @resource = Page.find(params[:id])

    case params[:state].to_sym
    when :visible
      @resource.publish if @resource.can_publish?
    when :hidden
      @resource.hide if @resource.can_hide?
    end

    render :template => 'admin/common/change_state', :layout => false
  end
  
end
