class ItemPicture < ActiveRecord::Base
  mount_uploader :picture, ItemPictureUploader

  belongs_to :item
  attr_accessible :main, :picture, :item_id, :picture_cache, :remove_picture

  validates :item_id, :picture, :presence => true
  
  scope :for_item_list, Proc.new{ |item_ids|
    {
      :conditions => ["item_id IN (?) AND main = 1", item_ids]
    }
  }

  def self.fetch_for_item_list(item_ids)
    {}.tap do |result|
      for_item_list(item_ids).each do |picture|
        result[picture.item_id] = picture.picture_url(:middle)
      end
    end
  end

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
