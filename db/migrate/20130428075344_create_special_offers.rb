class CreateSpecialOffers < ActiveRecord::Migration
  def change
    create_table :special_offers do |t|
      t.string :title
      t.text :body
      t.integer :page_id
      t.integer :item_id
      t.string :state, :limit => 30
      t.datetime :available_till
      t.integer :position, :default => 1000
      t.string :picture

      t.timestamps
    end

    add_index :special_offers, :page_id
    add_index :special_offers, :item_id
  end
end
