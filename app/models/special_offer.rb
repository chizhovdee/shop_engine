class SpecialOffer < ActiveRecord::Base
  mount_uploader :picture, InfoBlockPictureUploader

  belongs_to :page
  belongs_to :product

  attr_accessible :title, :body, :product_id, :position, :available_till, :page_id, :picture_cache, :picture, :remove_picture

  state_machine :initial => :hidden do
    state :hidden
    state :visible

    event :publish do
      transition :hidden => :visible
    end

    event :hide do
      transition :visible => :hidden
    end
  end

  def self.states
    [:hidden, :visible]
  end
end
