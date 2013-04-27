class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
      t.string :name
      t.string :value
      t.text :text
      t.integer :position, :default => 10000

      t.integer :product_id

      t.timestamps
    end

    add_index :product_features, :product_id
  end
end
