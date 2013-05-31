ActiveAdmin.register Category do

  config.sort_order = "parent_category_id_asc"

  form :partial => "form"

  index do
    column :id

    column :position, :sortable => :position do |resource| 
      div :class => :position do 
        resource.position
      end
    end

    column :name do |resource| 
      div :class => :name do 
        resource.name
      end
    end

    column :alias

    column :parent_category

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

  show do
    attributes_table do
      row :id
      row :name
      row :alias
      row :parent_category

      row :created_at
      row :updated_at

      row :state do |resource| 
        status_tag(resource.state, (:complete if resource.state == 'visible'))
      end

      row :position

      row :description do |resource|
        simple_format(resource.description)
      end
    end

    active_admin_comments
  end

  member_action :change_state, :method => :put do
    @resource = Category.find(params[:id])

    case params[:state].to_sym
    when :visible
      @resource.publish if @resource.can_publish?
    when :hidden
      @resource.hide if @resource.can_hide?
    end

    render :template => 'admin/common/change_state', :layout => false
  end

end
