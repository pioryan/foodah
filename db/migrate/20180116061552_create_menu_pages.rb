class CreateMenuPages < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_pages do |t|
      t.integer :menu_id, limit: 8
      t.integer :page_number, limit: 8
      t.integer :image_id, limit: 8
      t.integer :full_height, limit: 8
      t.integer :full_width, limit: 8
      t.string :uuid
      t.timestamps
    end
  end
end
