class CreateOrderCalls < ActiveRecord::Migration
  def change
    create_table :order_calls do |t|
      t.string :customer_name
      t.string :customer_email
      t.text   :customer_comment
      t.string :customer_phone
      t.text   :service_comment
      t.string :state

      t.timestamps
    end
  end
end
