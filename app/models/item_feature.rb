class ItemFeature < ActiveRecord::Base
  belongs_to :item

  attr_accessible :name, :item_id, :value, :text, :position

  validates :name, :position, :presence => true

  validates :position, :numericality => { :only_integer => true }
end
