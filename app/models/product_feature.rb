class ProductFeature < ActiveRecord::Base
  belongs_to :product

  attr_accessible :name, :product_id, :value, :text, :position

  validates :name, :position, :presence => true

  validates :position, :numericality => { :only_integer => true }
end
