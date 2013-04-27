class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.string :alias

      t.integer :parent_category_id
      
      t.text :description

      t.string :state, :limit => 30

      t.integer :position, :default => 10000

      t.timestamps
    end

    add_index :categories, :alias
    add_index :categories, :parent_category_id
  end
end
