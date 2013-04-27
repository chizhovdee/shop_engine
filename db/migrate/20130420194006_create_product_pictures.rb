class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.string :picture
      t.references :product
      t.boolean :main

      t.timestamps
    end
    add_index :product_pictures, :product_id
  end
end
