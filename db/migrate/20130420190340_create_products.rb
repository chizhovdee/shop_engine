class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :alias
      t.text :description
      t.integer :price
      t.integer :action_price
      t.datetime :action_available_till

      t.references :category

      t.timestamps
    end

    add_index :products, :category_id
  end
end
