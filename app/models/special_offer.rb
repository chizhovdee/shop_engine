class SpecialOffer < ActiveRecord::Base
  belongs_to :page
  belongs_to :product

  attr_accessible :title, :body, :product_id, :position, :available_till
end
