class SpecialOffer < ActiveRecord::Base
  mount_uploader :picture, InfoBlockPictureUploader

  belongs_to :page
  belongs_to :item

  attr_accessible :title, :body, :item_id, :position, :available_till, :page_id, :picture_cache, 
    :picture, :remove_picture, :place, :text_link

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

  def left_time
    available_till.to_i - Time.now.to_i
  end
end
