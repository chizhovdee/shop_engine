ActiveAdmin.register Item do
  config.sort_order = "category_id_asc"

  index do
    column :id

    column :name

    column :image do |item|
      html = ""
      
      if pic = item.item_pictures.find_all_by_main(true).first
        html << image_tag(pic.try(:picture_url, :small))
      else
        html << image_tag("no_photo.png")
      end

      html << "<br />"
      html << link_to(t(".add_edit_pictures"), admin_item_item_pictures_path(item))

      div :style => "text-align: center" do
        html.html_safe
      end
    end

    column :category

    column :price
    column :new_price

    column :status do |resource|
      result = "NEW" if resource.new_item?
      result = "HIT" if resource.hit?
      result = "ACTION" if resource.action?
      result = "DISCOUNT" if resource.discount?

      "<strong style='color: red'>#{ result }</strong>".html_safe
    end

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
      row :category

      row :image do
        html = ""

        item.item_pictures.each do |picture|
          html << image_tag(picture.picture_url(:middle), :class => "pictures #{ :main if picture.main? }")
        end

        html << "<br />"
        html << link_to("Add / Edit pictures", admin_item_item_pictures_path(item))

        html.html_safe
      end

      row :price
      row :new_price

      row :new_item
      row :hit

      row :action
      row :action_available_till
      
      row :discount
      row :discount_available_till

      row :created_at
      row :updated_at

      row :state do |resource| 
        status_tag(resource.state, (:complete if resource.state == 'visible'))
      end

      row :position

      row :description do |resource|
        resource.description.html_safe
      end

      row :body do |resource|
        resource.body.html_safe
      end

      row :additional do |resource|
        resource.additional.html_safe
      end

      row :features do |resource|
        link_to("All features", admin_item_item_features_path(item))
      end
    end

    active_admin_comments
  end

  form :partial => "form"

  member_action :change_state, :method => :put do
    @resource = Item.find(params[:id])

    case params[:state].to_sym
    when :visible
      @resource.publish if @resource.can_publish?
    when :hidden
      @resource.hide if @resource.can_hide?
    end

    render :template => 'admin/common/change_state', :layout => false
  end
end
