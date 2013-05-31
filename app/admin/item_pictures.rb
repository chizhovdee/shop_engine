ActiveAdmin.register ItemPicture do
  belongs_to :item

  form :partial => "form"

  index do
    column :main do |resource|
      radio_button_tag(:main, resource.id, resource.main?)
    end

    column :item

    column :picture do |resource|
      image_tag(resource.picture_url(:small))
    end

    column :created_at

    column :updated_at

    default_actions
  end

  show do |resource|
    attributes_table do
      row "all_pictures" do |resource|
        link_to(t(".all_pictures"), admin_item_item_pictures_path(resource.item))
      end

      row :item

      row :picture do
        image_tag(resource.picture_url(:middle))
      end

      row :main
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end

  member_action :mark_as_main, :method => :put do
    picture = ItemPicture.find(params[:id])
    picture.mark_as_main!

    render :text => "Picture marked as 'main'"
  end
end
