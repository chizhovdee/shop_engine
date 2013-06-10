class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.string :customer_name
      t.string :customer_email
      t.text   :customer_address
      t.text   :customer_comment
      t.string :customer_phone
      t.text   :service_comment
      t.string :state

      t.timestamps
    end

    add_index :orders, :item_id
  end
end
