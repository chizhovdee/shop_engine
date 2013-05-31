class AddHitAndDiscountToItems < ActiveRecord::Migration
  def up
    add_column :items, :new_price, :integer
    add_column :items, :hit, :boolean, :default => false
    add_column :items, :new_item, :boolean, :default => false
    add_column :items, :discount, :boolean, :default => false
    add_column :items, :discount_available_till, :datetime
    
    remove_column :items, :action_price
  end

  def down
    remove_column :items, :discount
    remove_column :items, :hit
    remove_column :items, :new_price
    remove_column :items, :discount_available_till
    remove_column :items, :new_item

    add_column :items, :action_price, :integer
  end
end
