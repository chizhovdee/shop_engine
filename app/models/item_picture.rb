class ItemPicture < ActiveRecord::Base
  mount_uploader :picture, ItemPictureUploader

  belongs_to :item
  attr_accessible :main, :picture, :item_id, :picture_cache, :remove_picture

  validates :item_id, :picture, :presence => true

  def mark_as_main!
    transaction do
      item.item_pictures.find_all_by_main(true).each do |picture|
        picture.main = false
        picture.save!
      end

      self.main = true

      save!
    end
  end
end
