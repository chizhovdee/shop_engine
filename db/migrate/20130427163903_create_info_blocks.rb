class CreateInfoBlocks < ActiveRecord::Migration
  def change
    create_table :info_blocks do |t|
      t.string :title
      t.text :body
      t.string :picture
      t.integer :page_id
      t.string :state, :limit => 30

      t.timestamps
    end

    add_index :info_blocks, :page_id
  end
end
