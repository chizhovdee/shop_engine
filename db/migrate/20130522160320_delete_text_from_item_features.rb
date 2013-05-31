class DeleteTextFromItemFeatures < ActiveRecord::Migration
  def up
    remove_column :item_features, :text
  end

  def down
    add_column :item_features, :text, :text
  end
end
