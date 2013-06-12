ActiveAdmin.register OrderCall do
  config.sort_order = "created_at_asc"

  index do
    column :id

    column :customer_name

    column :customer_phone

    column :customer_email

    column :created_at

    column :updated_at

    column :state do |resource|
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

    default_actions
  end


  show do
    attributes_table do
      row :id

      row :customer_name

      row :customer_phone

      row :customer_email

      row :created_at

      row :updated_at

      row :state, :class => 'state' do |resource|
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

      row :customer_comment do |resource|
        simple_format(resource.customer_comment)
      end

      row :service_comment do |resource|
        simple_format(resource.service_comment)
      end

    end

    active_admin_comments
  end

  member_action :change_state, :method => :put do
    @resource = OrderCall.find(params[:id])

    case params[:state].to_sym
    when :accepted
      @resource.accept if @resource.can_accept?
      
    when :closed
      @resource.close if @resource.can_close?      
    end

    render :template => 'admin/common/change_state', :layout => false
  end
  
end
