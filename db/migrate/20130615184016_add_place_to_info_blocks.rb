class AddPlaceToInfoBlocks < ActiveRecord::Migration
  def change
    add_column :info_blocks, :place, :string
    add_column :info_blocks, :text_link, :string
    add_column :special_offers, :place, :string
    add_column :special_offers, :text_link, :string
  end
end
