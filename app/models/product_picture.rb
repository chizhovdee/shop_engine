class ProductPicture < ActiveRecord::Base
  mount_uploader :picture, ProductPictureUploader

  belongs_to :product
  attr_accessible :main, :picture, :product_id, :picture_cache, :remove_picture

  validates :product_id, :picture, :presence => true

  def mark_as_main!
    transaction do
      product.product_pictures.find_all_by_main(true).each do |picture|
        picture.main = false
        picture.save!
      end

      self.main = true

      save!
    end
  end
end
