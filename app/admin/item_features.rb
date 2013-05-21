ActiveAdmin.register ItemFeature do
  belongs_to :item

  form :partial => "form"
  
end
