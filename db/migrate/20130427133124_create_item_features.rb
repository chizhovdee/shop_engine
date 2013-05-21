class CreateItemFeatures < ActiveRecord::Migration
  def change
    create_table :item_features do |t|
      t.string :name
      t.string :value
      t.text :text
      t.integer :position, :default => 10000

      t.integer :item_id

      t.timestamps
    end

    add_index :item_features, :item_id
  end
end
