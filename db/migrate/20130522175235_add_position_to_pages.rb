class AddPositionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :position, :integer, :default => 1000
    add_column :pages, :service, :boolean, :default => false
    add_column :pages, :state, :string, :limit => 50
  end
end
