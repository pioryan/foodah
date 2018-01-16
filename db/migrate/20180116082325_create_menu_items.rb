class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.integer :menu_page_id
      t.integer :price
      t.integer :high_price
      t.integer :dish_id
      t.integer :xpos
      t.integer :ypos
      t.timestamps
    end
  end
end
