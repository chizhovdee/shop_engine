ActiveAdmin.register ProductFeature do
  belongs_to :product

  form :partial => "form"
  
end
