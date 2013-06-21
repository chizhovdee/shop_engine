class InfoBlock < ActiveRecord::Base
  mount_uploader :picture, InfoBlockPictureUploader

  belongs_to :page

  attr_accessible :body, :picture, :title, :page_id, :picture_cache, :place, :remove_picture, :text_link

  validates :title, :page_id, :presence => true

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
