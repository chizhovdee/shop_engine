class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :alias
      t.string :articul
      t.text :description
      t.text :body
      t.text :additional
      t.integer :price
      t.integer :action_price
      t.datetime :action_available_till
      t.string :video_url

      t.string :state, :limit => 30

      t.references :category

      t.integer :position, :default => 10000

      t.integer :count_orders

      t.boolean :action

      t.timestamps
    end

    add_index :items, :category_id
    add_index :items, :alias
  end
end
