class CreateItemPictures < ActiveRecord::Migration
  def change
    create_table :item_pictures do |t|
      t.string :picture
      t.references :item
      t.boolean :main

      t.timestamps
    end
    add_index :item_pictures, :item_id
  end
end
