class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :alias

      t.text :body

      t.timestamps
    end

    add_index :pages, :alias
  end
end
