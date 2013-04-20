class Product < ActiveRecord::Base
  belongs_to :category

  attr_accessible :action_available_till, :action_price, :description, :name, :price, :alias, :category_id

  validates :name, :price, :description, :category_id, :alias, :presence => true

end