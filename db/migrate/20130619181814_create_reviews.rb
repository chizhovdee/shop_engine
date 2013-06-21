class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.string :office
      t.string :site
      t.text :body
      t.string :picture
      t.string :state

      t.timestamps
    end
  end
end
