ActiveAdmin.register Page do
  form :partial => "form"

  show do
    attributes_table do
      row :id
      row :title
      row :alias
      row :body do |resource|
        simple_format(resource.body)
      end

      row :created_at
      row :updated_at
    end

    active_admin_comments
  end

  index do
    column :id

    column :title

    column :alias

    column :created_at

    column :updated_at

    default_actions
  end
  
end
