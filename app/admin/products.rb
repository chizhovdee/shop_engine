ActiveAdmin.register Product do
  index do
    column :id

    column :name

    column :image do |product|
      html = ""

      html << image_tag(product.product_pictures.find_all_by_main(true).first.try(:picture_url, :small))
      html << "<br />"
      html << link_to("All pictures", admin_product_product_pictures_path(product))

      div :style => "text-align: center" do
        html.html_safe
      end
    end

    column :category

    column :alias

    column :price

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

    column :position

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :alias
      row :category

      row :image do
        html = ""

        html << image_tag(product.product_pictures.find_all_by_main(true).first.try(:picture_url, :middle))
        html << "<br />"
        html << link_to("All pictures", admin_product_product_pictures_path(product))

        html.html_safe
      end

      row :price
      row :action
      row :action_price
      row :action_available_till

      row :created_at
      row :updated_at

      row :state do |resource| 
        status_tag(resource.state, (:complete if resource.state == 'visible'))
      end

      row :position

      row :description do |resource|
        simple_format(resource.description)
      end

      row :additional do |resource|
        simple_format(resource.additional)
      end

      row :features do |resource|
        link_to("All features", admin_product_product_features_path(product))
      end
    end

    active_admin_comments
  end

  form :partial => "form"

  member_action :change_state, :method => :put do
    @resource = Product.find(params[:id])

    case params[:state].to_sym
    when :visible
      @resource.publish if @resource.can_publish?
    when :hidden
      @resource.hide if @resource.can_hide?
    end

    render :template => 'admin/common/change_state', :layout => false
  end
end
