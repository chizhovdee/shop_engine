ActiveAdmin.register SpecialOffer do
  form :partial => "form"

  index do
    column :id

    column :title do |resource| 
      div :class => :name do 
        resource.title
      end
    end

    column :picture do |resource|
      image_tag(resource.picture_url) if resource.picture?
    end

    column :item

    column :page

    column :created_at

    column :updated_at

    column :position

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

  show do
    attributes_table do
      row :id
      row :title do |resource| 
        div :class => :name do 
          resource.title
        end
      end
      row :page

      row :item

      row :picture do |resource|
        image_tag(resource.picture_url) if resource.picture?
      end

      row :state do |resource| 
        status_tag(resource.state, (:complete if resource.state == 'visible'))
      end

      row :position

      row :created_at
      row :updated_at

      row :body do |resource|
        simple_format(resource.body)
      end
    end

    active_admin_comments
  end

  member_action :change_state, :method => :put do
    @resource = SpecialOffer.find(params[:id])

    case params[:state].to_sym
    when :visible
      @resource.publish if @resource.can_publish?
    when :hidden
      @resource.hide if @resource.can_hide?
    end

    render :template => 'admin/common/change_state', :layout => false
  end
  
end
